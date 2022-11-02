// Task:
// Develop a function that is going to calculate Pedersen hash of an array of felts.
// Cairo's built in hash2 can calculate Pedersen hash on two field elements.
// To calculate hash of an array use hash chain algorith where hash of [1, 2, 3, 4] is is H(H(H(1, 2), 3), 4).
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.alloc import alloc

func fill_array(new_array: felt*, arr_ptr: felt*, new_Idx: felt, old_Idx: felt, arr_len: felt) -> (arr_ptr: felt*) {
    assert new_array[new_Idx] = arr_ptr[old_Idx];

    tempvar idx_diff = arr_len - old_Idx;

    if(idx_diff == 0) {
        return(arr_ptr=new_array);
    }

    return fill_array(new_array, arr_ptr, new_Idx + 1, old_Idx + 1, arr_len);    
}

// Computes the Pedersen hash chain on an array of size `arr_len` starting from `arr_ptr`.
func hash_chain{hash_ptr: HashBuiltin*}(arr_ptr: felt*, arr_len: felt) -> (result: felt) {
    alloc_locals;

    if (arr_len == 2) {
        let (result) = hash2(x=[arr_ptr], y=[arr_ptr + 1]);
        return (result=result);
    } else {
        let (result) = hash2(x=[arr_ptr], y=[arr_ptr + 1]);
        %{ print(f"Value= {ids.arr_ptr}") %}

        let (local temp_array: felt*) = alloc();
        assert temp_array[0] = result;
        
        let (newArray) = fill_array(temp_array, arr_ptr, 1, 2, arr_len - 1);

        return hash_chain(newArray, arr_len - 1);
    }
}