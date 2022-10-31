// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    if (n == 0) {
        return (sum=0);
    }
    
    let (sum) = calculate_sum(n=n-1);
    let temp_sum = sum + n;
    
    return (sum=temp_sum,);
}
