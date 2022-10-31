%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {
    if (n == 0) {
        return (true=1);
    } else {
        if (n == 1) {
            return (true=1);
        }
    }

    let (firstDigit) = bitwise_and(n, 1); // right-most bit
    let (zeroLast) = bitwise_and(n, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE); //zero out the last bit   
    tempvar shifted = zeroLast / 2; // remove final bit    
    let (secondDigit) = bitwise_and(shifted, 1); // next right-most bit    

    let (result) = bitwise_xor(firstDigit, secondDigit);

    if (result == 1) {
        return pattern(shifted, 0, 0, 0);
    }
    
    return (true=0);
}
