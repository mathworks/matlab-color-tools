function bytes = encodeInteger(int)

int = color.icc.utils.toBigEndian(int);
bytes = typecast(int, 'uint8');