// Perform and log output of simple arithmetic operations

func simple_math() {
   // adding 13 +  14
   tempvar sum = 13 + 14;
   %{ print(f"Add {ids.sum}") %}

   // multiplying 3 * 6
   tempvar mul = 3 * 6;
   %{ print(f"Mul {ids.mul}") %}

   // dividing 6 by 2
   tempvar div1 = 6 / 2;
   %{ print(f"Div1 {ids.div1}") %}

   // dividing 70 by 2
   tempvar div2 = 70 / 2;
   %{ print(f"Div2 {ids.div2}") %}

   // dividing 7 by 2
   tempvar div3 = 7 / 2;
   %{ print(f"Div3 {ids.div3}") %}

    return ();
}
