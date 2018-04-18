function tf = computerIsLittleEndian

[~, ~, endian] = computer;
tf = strcmp(endian, 'L');
