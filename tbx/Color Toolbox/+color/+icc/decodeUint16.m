function values = decodeUint16(bytes)
%decodeUint16 Decode uint16Number type
%
%   SYNTAX
%
%   values = decodeUint16(bytes)
%
%   DESCRIPTION
%
%   Converts a uint8 vector representing the ICC encoding of uint16Numbers
%   into a uint16 vector. The input vector, bytes, must have a length that
%   is a multiple of two. The length of the output vector is
%   length(bytes)/2.
%
%   EXAMPLE
%
%   Convert an encoded ICC uint16Number to a MATLAB uint16 value.
%
%       bytes = uint8([1 0]);
%       value = images.color.icc.decodeUint16(bytes)
%
%   See also encodeUint16

%   Copyright 2010-2011 The MathWorks, Inc.

%   References:
%     * ICC version 2.4, section 5.3.6
%     * ICC version 4.2, section 5.1.7
%     * ICC version 4.3, section 4.10

validateattributes(bytes, {'uint8'}, {});
color.icc.utils.checkVectorLengthMultiple(bytes, 2);

values = color.icc.decodeInteger(bytes, 'uint16');





