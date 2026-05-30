classdef AdcRead < realtime.internal.SourceSampleTime ...
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
    
    properties (Nontunable)
        % 0<=adc channels<=15
        adcChannels=uint8([7,0,2]);
        % analog gains for each channel (1, 2 or 4)
        adcGains=uint8([4,1,2]);

        % internal filter shift 
        shift=uint8(0);
        %: F(z) = a/(1-a.z^-1) , with a=[1-2^-shift] 
        
        
     end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    methods
        % Constructor
        function obj = AdcRead(varargin)
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
                coder.cinclude('adc_arduino.h');
                coder.ceval('adcSetup', length(obj.adcChannels),uint8(obj.adcChannels),uint8(obj.adcGains),uint8(obj.shift));
            end
        end
        
        function varargout = stepImpl(obj)   %#ok<MANU>
            
            if isempty(coder.target)
                % Place simulation output code here
            else
                for i=1:nargout
                    varargout{i}=uint16(0);
                    % Call C-function implementing device output
                    varargout{i} = coder.ceval('readAdc', i-1);
                end
            end
        end
        
        function releaseImpl(obj) %#ok<MANU>
            if isempty(coder.target)
                % Place simulation termination code here
            else
                % Call C-function implementing device termination
                
                % No termination
            end
        end
    end
    
    methods (Access=protected)
        %% Define output properties
        function num = getNumInputsImpl(~)
            num = 0;
        end
        
        function num = getNumOutputsImpl(obj)
            num = length(obj.adcChannels);
        end
        
        function flag = isOutputSizeLockedImpl(~,~)
            flag = false;
        end
        
        function varargout = isOutputFixedSizeImpl(~,~)
            for i=1:nargout
                varargout{i} = true;
            end
        end
        
        function flag = isOutputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isOutputComplexImpl(~)
            for i=1:nargout
              varargout{i} = false;
            end  
        end
        
        function varargout = getOutputSizeImpl(~)
            for i=1:nargout
                varargout{i} = [1,1];
            end
        end
        
        function varargout = getOutputDataTypeImpl(~)
            for i=1:nargout
                varargout{i} = 'uint16';
            end
        end
        
        function icon = getIconImpl(~)
            % Define a string as the icon for the System block in Simulink.
            s='';
            s=sprintf('%s\n%s',s,'0<=adcs(due)<4096');
            s=sprintf('%s\n%s',s,'use only one block for all channels');
            s=sprintf('%s\n%s',s,'example:\n');
            s=sprintf('%s\n%s',s,'channels=[2,5,0] has 3 ouputs : A2,A5,A0');
            
            icon = s;
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
            name = 'Adc';
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

                addSourceFiles(buildInfo, 'adc_arduino.cpp', srcDir);

                %addSourceFiles(buildInfo,'source.c',srcDir);
                %addLinkFlags(buildInfo,{'-lSource'});
                %addLinkObjects(buildInfo,'sourcelib.a',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
