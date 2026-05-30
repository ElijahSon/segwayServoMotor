classdef PwmWrite < realtime.internal.SourceSampleTime ...
        & coder.ExternalDependency ...
        & matlab.system.mixin.Propagates ...
        & matlab.system.mixin.CustomIcon
    %
    % System object template for a source block.
    % 
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    % NOTE: When renaming the class name Source, the file name and
    % constructor name must be updated to use the class name.
    
    
    % Copyright 2016-2018 The MathWorks, Inc.
    %#codegen
    %#ok<*EMCA>
    
    properties
        % Public, tunable properties.
    end
        properties (Constant, Hidden)
        % AvailablePin specifies the range of values allowed for Pin. You
        % can customize the AvailablePin for a particular board. For
        % example, use AvailablePin = 2:13 for Arduino Uno.
        AvailablePin = [[34,35],[36,37],[38,39],[40,41],[8,44],[7,45],6,9];
    end
    properties (Nontunable)
        % Pin
        pin=uint8(34)
        % use Complementary Pin
        useComplementaryPin=uint8(0);
        % period en Micro Secondes
        periodMicros=single(100);
        % ID, from 0 to 
        id=uint8(0);
    end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    methods
        function set.pin(obj,value)
            coder.extrinsic('sprintf') % Do not generate code for sprintf
            validateattributes(value,...
                {'numeric'},...
                {'real', 'positive', 'integer','scalar'},...
                '', ...
                'pin');
            assert(any(value == obj.AvailablePin), ...
                'Invalid value for Pin. Pin must be one of the following: %s', ...
                sprintf('%s',' [34,compl=35],[36,compl=37],[38,compl=39],[40,compl=41],[8,compl=44], [7,compl=45], [6, no compl] , [9,no compl]'));
            obj.pin = value;
        end
        % Constructor
        function obj = PwmWrite(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
    end
    
    methods (Access=protected)

        function setupImpl(obj) %#ok<MANU>
            if isempty(coder.target)
                % Place simulation setup code here
            else
                % Call C-function implementing device initialization               
                coder.cinclude('pwmwrite_arduino.h');
                if (obj.useComplementaryPin)
                  %in this case, idle state is 50% duty cycle 
                coder.ceval('pwmSetup', obj.pin, obj.useComplementaryPin, obj.periodMicros,obj.periodMicros/2, obj.id);
                else
                  %in this case, idle state is 0% duty cycle                     
                  coder.ceval('pwmSetup', obj.pin, obj.useComplementaryPin, obj.periodMicros,0, obj.id);
                end
            end
        end
        %-------------------------------------------------------
        % here is the implementation at each step
        %--------------------------------------------------------
        function stepImpl(obj,u)
           if isempty(coder.target)
                % Place simulation output code here
           else
                % Call C-function implementing device output
                 coder.ceval('pwmWrite', u, obj.id );  

            end
        end
        
        function releaseImpl(obj) 
            if isempty(coder.target)
                % Place simulation termination code here
            else
                % Call C-function implementing device termination
                coder.ceval('pwmStop', obj.id );
                % No termination
            end
        end
    end
    
    methods (Access=protected)
        %% Define input properties
        function num = getNumInputsImpl(~)
            num = 1;
        end
        
        function num = getNumOutputsImpl(~)
            num = 0;
        end
        
        function flag = isInputSizeLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputFixedSizeImpl(~,~)
            varargout{1} = true;
        end
        
        function flag = isInputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputComplexImpl(~)
            varargout{1} = false;
        end
        
        function varargout = getInputSizeImpl(~)
            varargout{1} = 0;
        end
        
  
        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'single';
        end
        
        function icon = getIconImpl(~)
            % Define a string as the icon for the System block in Simulink.
            icon = sprintf('%s\n%s\n%s','-1<=Pwm<=1','pins : 6,9','7-45,8-44,34-35,36-37,38-39,40-41');
        end    
    end
    
    methods (Static, Access=protected)
        function simMode = getSimulateUsingImpl(~)
            simMode = 'Interpreted execution';
        end
        
        function isVisible = showSimulateUsingImpl
            isVisible = false;
        end
    end
    
    methods (Static)
        function name = getDescriptiveName()
            name = 'Source';
        end
        
        function b = isSupportedContext(context)
            b = context.isCodeGenTarget('rtw');
        end
        
        function updateBuildInfo(buildInfo, context)
            if context.isCodeGenTarget('rtw')
                % Update buildInfo
                srcDir = fullfile(fileparts(mfilename('fullpath')),'src');
                includeDir = fullfile(fileparts(mfilename('fullpath')),'include');
                addIncludePaths(buildInfo,includeDir);
                % Use the following APIs to add include files, sources and
                % linker flags

                addSourceFiles(buildInfo, 'pwmwrite_arduino.cpp', srcDir);
                addSourceFiles(buildInfo, 'pwm_defs.cpp', srcDir);

                %addSourceFiles(buildInfo,'source.c',srcDir);
                %addLinkFlags(buildInfo,{'-lSource'});
                %addLinkObjects(buildInfo,'sourcelib.a',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
