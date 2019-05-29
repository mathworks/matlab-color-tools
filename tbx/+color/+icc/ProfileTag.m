%ProfileTag ICC profile tag
%
%   color.icc.ProfileTag is an abstract class that provides common
%   behaviors for ICC profile tag classes.
%
%   Provided behaviors:
%
%      * Signature property and validation
%      * Description property and lookup behavior
%
%   Subclasses must provide:
%
%      * An immutable Type property
%      * An encode method that converts a tag to a uint8 row vector
%      * A static decode method that converts a uint8 row vector to a tag

% Copyright 2010-2018 The Mathworks, Inc.

classdef ProfileTag
    
    properties
        Signature(1,1) string {mustBeAtMostFourCharacters} = ""
    end
    
    properties (Dependent, SetAccess = private)
        Description
    end
    
    properties (Abstract, SetAccess = immutable)
        Type
    end
        
    methods        
        function description = get.Description(tag)
            sig = tag.Signature;
            if (sig == "")
                description = "";
            else
                signatures = color.icc.tagSignatures;
                description = signatures.Name(signatures.Signature == sig);
                if isempty(description)
                    % TODO: Add information about registered private tags.
                    description = "private tag";
                end
            end
        end
    end
    
    methods (Static, Abstract)
        tag = decode(bytes)
    end
    
    methods (Abstract)
        bytes = encode(this_tag)
    end    
        
end

function mustBeAtMostFourCharacters(sig)
if strlength(sig) > 4
    error('Too many characters. Specify a signature with at most four characters.')
end
end