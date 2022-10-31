// Implement a funcion that returns:
// - 1 when magnitudes of inputs are equal
// - 0 otherwise
func abs_eq(x: felt, y: felt) -> (bit: felt) {
    if(x == -y) {
        return (bit=1);
    } else {
        if (x == y) {
            return (bit=1);
        }
    }

    return (bit=0);
}
