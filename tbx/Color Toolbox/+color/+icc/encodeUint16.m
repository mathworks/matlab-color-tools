function bytes = encodeUint16(values)
%encodeUint16 Encode ICC uint16Number type
%
%   SYNTAX
%
%   bytes = encodeUint16(values)
%
%   DESCRIPTION
%
%   Converts a uint16 vector (or a double vector) to a vector of bytes
%   (uint8 values) representing the corresponding ICC uint16Number
%   encoding. The length of the output vector is 2*length(values).
%
%   EXAMPLE
%
%   Convert the uint16 value 25630 to ICC uint16Number encoding.
%
%       bytes = images.color.icc.encodeUint16(uint16(25630))
%
%   See also decodeUint16

%   Copyright 2010-2011 The MathWorks, Inc.

%   References
%     * ICC version 2.4, section 5.3.6
%     * ICC version 4.2, section 5.1.7
%     * ICC version 4.3, section 4.10

validateattributes(values, {'uint16', 'double'}, {'vector'});

bytes = color.icc.encodeInteger(uint16(values));
