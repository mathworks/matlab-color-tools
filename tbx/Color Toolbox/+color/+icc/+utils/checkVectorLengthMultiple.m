function validateVectorLengthMultiple(v, q)
%validateVectorLengthMultiple Check that length of input is a valid multiple
%
%   SYNTAX
%
%   validateVectorLengthMultiple(v, q)
%
%   DESCRIPTION
%
%   validateVectorLengthMultiple(v, q) returns silently if v is a vector
%   whose length is a multiple of q. Otherwise it throws an error.
%
%   EXAMPLES
%
%   Check that the variable in is a vector whose length is a multiple of 3.
%
%       in = [1 2 3];
%       images.internal.validateVectorLengthMultiple(in, 3);

%   Copyright 2010-2011 The MathWorks, Inc.

if ~isvector(v)
    throwAsCaller(MException('color:icc:NotAVector', ...
        'The input must be a vector. The input size is %s.', ...
        mat2str(size(v))));
end

val = numel(v) / q;
if val ~= floor(val)
    throwAsCaller(MException('color:icc:BadVectorLengthMultiple', ...
        'The input vector length, %d, is not a multiple of %d.', ...
        numel(v), q));
end
