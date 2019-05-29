function out = toBigEndian(in)
%toBigEndian Convert integer to big endian representation.
%
%   SYNTAX
%
%      out = toBigEndian(in)
%
%   DESCRIPTION
%
%   toBigEndian(in) converts the input vector to a big endian byte format.
%   Typically, this function is used just before or after a call to
%   typecast.
%
%   EXAMPLE
%
%       v = uint16(1);
%       typecast(v,'uint8')
%
%       v2 = color.icc.utils.toBigEndian(v)
%
%       typecast(v2,'uint8')

%   Copyright 2010-2018 The MathWorks, Inc.

out = in;

if color.icc.utils.computerIsLittleEndian
    out = swapbytes(out);
end