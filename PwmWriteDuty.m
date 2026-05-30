classdef PwmWriteDuty < realtime.internal.SourceSampleTime ...
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
        AvailablePin = [6,7,8,9,34,36,38,40];
    end
    properties (Nontunable)
        % Pin
        pin=uint8(6)
        % periode en Micro Secondes
        periodMicros=single(20000);
        % ID
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
                sprintf('%s',' [6,7,8,9,34,36,38,40]'));
            obj.pin = value;
        end
        % Constructor
        function obj = PwmWriteDuty(varargin)
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
                use_complementary=uint8(0);
                coder.ceval('pwmSetup', obj.pin, use_complementary, obj.periodMicros,1500.0, obj.id);
            end
        end
        %-------------------------------------------------------
        % here is the implementation at each step
        %--------------------------------------------------------
        function stepImpl(obj,duty_us)
           if isempty(coder.target)
                % Place simulation output code here
           else
                % Call C-function implementing device output
                 coder.ceval('pwmWriteDutyMicros', duty_us, obj.id );  

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
            icon = '500us<=duty<=2500us';
            icon = sprintf('%s\n%s\n%s','100us<=duty<=2900us','pins : 6,7,8,9','34,36,38,40');
            
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
