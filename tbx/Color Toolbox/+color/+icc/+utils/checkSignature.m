function checkSignature(bytes, expected_sig)
actual_sig = char(bytes(1:min(end,4)));
if ~strcmp(expected_sig, actual_sig)
    throwAsCaller(MException('color:icc:BadSig', ...
        'Expected the signature "%s" during decoding but instead encountered the signature "%s".', ...
        expected_sig, actual_sig));
end
