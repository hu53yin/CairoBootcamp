from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    alloc_locals;

    let (is_even) = bitwise_and(1, arr[idx]);
    tempvar sum = run;

    if (is_even == 0) {
        tempvar sum = run + arr[idx];
    }

    tempvar idx_diff = arr_len - idx;
    
    if (idx_diff == 1) {
        return (sum=sum);
    }

    return sum_even(arr_len, arr, sum, idx + 1);
}
