function out = toBigEndian(in)

out = in;

if color.icc.utils.computerIsLittleEndian
    out = swapbytes(out);
end