function out = decodeInteger(bytes, output_type)

out = typecast(bytes, output_type);

if color.icc.utils.computerIsLittleEndian
    out = swapbytes(out);
end




