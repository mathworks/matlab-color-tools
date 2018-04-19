function tests = toBigEndian_test
tests = functiontests(localfunctions);
end

function basicCase_test(test_case)
actual = typecast(color.icc.utils.toBigEndian(uint16(1)),'uint8');
expected = uint8([0 1]);
verifyEqual(test_case,actual,expected);
end
