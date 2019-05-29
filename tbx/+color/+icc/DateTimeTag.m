%DateTimeTag ICC profile dateTimeType tag
%
%   SYNTAX
%
%   tag = color.icc.DateTimeTag
%   tag = color.icc.DateTimeTag(dt)
%
%   DESCRIPTION
%
%   color.icc.DateTimeTag creates an ICC profile dateTimeType tag from the
%   current system time.
%
%   color.icc.DateTimeTag(dt) creates a dateTimeType tag using the
%   specified datetime value.
%
%   EXAMPLES
%
%   Make a DateTimeTag based on the current time.
%
%       tag = color.icc.DateTimeTag
%
%   Make a DateTimeTag based on a date string.
%
%       tag = color.icc.DateTimeTag(datetime('July 16, 1969'))
%
%   Encode a DateTimeTag as a vector of bytes (uint8 values)
%
%       tag = color.icc.DateTimeTag(datetime('July 16, 1969'));
%       encode(tag)
%
%   Decode a vector of bytes (uint8 values) to form a DateTimeTag.
%
%       bytes = uint8([100 116 105 109 0 0 0 0 7 177 0 7 0 16 ...
%                      0 0 0 0 0 0]);
%       tag = color.icc.DateTimeTag.decode(bytes)
%
%   REFERENCE
%
%   Specification ICC.1:2010-12 (Profile version 4.3.0.0), section 10.7

%   Copyright 2010-2018 The MathWorks, Inc.

classdef DateTimeTag < color.icc.ProfileTag
    
    properties (SetAccess = immutable)
        Type = "dtim"
    end      
    
    properties
        DateTime(1,1) datetime = datetime('now')
    end
    
    methods
        function this_tag = DateTimeTag(dt)
            if nargin >= 1
                this_tag.DateTime = dt;
            end
        end
                    
        function bytes = encode(this_tag)
            dt = this_tag.DateTime;
            bytes = [ ...
                uint8('dtim'), ...
                zeros(1, 4, 'uint8'), ...
                color.icc.encodeDateTimeNumber(dt) ];
        end
        
    end
    
    methods (Static)
        function tag = decode(bytes)
            color.icc.utils.checkMinNumBytes(bytes, 20);
            color.icc.utils.checkSignature(bytes, "dtim");
            
            dt = color.icc.decodeDateTimeNumber(bytes(9:20));
            tag = color.icc.DateTimeTag(dt);
        end
    end
end

