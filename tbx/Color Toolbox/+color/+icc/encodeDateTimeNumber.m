function bytes = encodeDateTimeNumber(dt)
%encodeDateTimeNumber Encode ICC dateTimeNumber type
%
%   SYNTAX
%
%   bytes = encodeDateTimeNumber(date_time_number)
%
%   DESCRIPTION
%
%   bytes = encodeDateTimeNumber(date_time_number) converts the MATLAB
%   representation of an ICC dateTimeNumber to a vector of bytes suitable
%   for writing directly to an ICC profile. date_time_number is a 6-element
%   double vector containing:
%
%       1. Number of the year (for example, 1994)
%       2. Number of the month (1 to 12)
%       3. Number of the day of the month (1 to 31)
%       4. Number of hours (0 to 23)
%       5. Number of minutes (0 to 59)
%       6. Number of seconds (0 to 59)
%
%   bytes is a 12-element uint8 vector containing the encoded byte values.
%
%   date_time_number can also be a vector containing the representation of
%   multiple dateTimeNumber values. In this case the length must be a
%   multiple of 12, and the length of bytes is length(date_time_number)/2.
%
%   The input values are assumed to be in UTC.
%
%   EXAMPLES
%
%   Convert a six-element vector representing the date August 30, 1986
%   14:30:00 into a byte vector.
%
%       date_time_number = [1986 8 30 14 30 0];
%       bytes = images.color.icc.encodeDateTimeNumber(date_time_number)
%
%   See also decodeDateTimeNumber

%   Copyright 2010-2013 The MathWorks, Inc.

%   References:
%     * ICC version 2.4, section 5.3.1
%     * ICC version 4.2, section 5.1.1
%     * ICC version 4.3, section 4.2


validateattributes(dt, {'datetime'}, {'scalar'});

v = [dt.Year dt.Month dt.Day, dt.Hour dt.Minute min(round(dt.Second),59)];

bytes = color.icc.encodeUint16(v);
