function vec = decodeDateTimeNumber(bytes)
%decodeDateTimeNumber Decode ICC dateTimeNumber type
%
%   SYNTAX
%
%   vec = images.color.icc.decodeDateTimeNumber(bytes)
%
%   DESCRIPTION
%
%   Converts a vector of bytes to a representation of an ICC DateTimeNumber
%   type. bytes must be a uint8 vector with a length that is a multiple of
%   12. vec is a double vector whose length is numel(bytes) / 2. Each group
%   of 6 elements of vec contains:
%
%       1. Number of the year (for example, 1994)
%       2. Number of the month (1 to 12)
%       3. Number of the day of the month (1 to 31)
%       4. Number of hours (0 to 23)
%       5. Number of minutes (0 to 59)
%       6. Number of seconds (0 to 59)
%
%   EXAMPLE
%
%   Convert a vector of 12 bytes into a six-element vector representing an
%   ICC DateTimeNumber value.
%
%       bytes = uint8([7 194 0 8 0 30 0 14 0 13 0 0]);
%       value = images.color.icc.decodeDateTimeNumber(bytes)
%
%   See also encodeDateTimeNumber

%   Copyright 2010-2011 The MathWorks, Inc.

%   References: 
%     * ICC version 2.4, section 5.3.1
%     * ICC version 4.2, section 5.1.1
%     * ICC version 4.3, section 4.2

validateattributes(bytes, {'uint8'}, {});
color.icc.utils.checkVectorLengthMultiple(bytes, 12);

vec = double(color.icc.decodeUint16(bytes));

