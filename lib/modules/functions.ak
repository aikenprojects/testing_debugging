use aiken/option

// trace 
// ? operator

pub fn increment(n: Int, step: Option<Int>){
    // trace label
    // trace @"Inside fn Increment"

    // // trace variable
    // trace n

    // trace variable
    // trace step
    

    
    // // trace @"LABEL" ; variable
    // trace @"Inside fn increment": n
    // trace @"Inside fn increment": n, step

   // One way 
    // n + when step is {
    //     Some(value) -> value
    //     None -> 1
    // }

    // Second Way 
    let step = option.or_else(step, 1)
    n + step

}

// // unit testing

// // It can return :
// //  - True
// //  - False
// //  - Fail
// test increment_test(){
//     // ? operator
//     and {
//         (increment(1,Some(2)) ==3)?,
//         (increment(4,None) ==5)?,
//         (increment(3,Some(2)) ==5)?,
//         (increment(0,Some(1)) ==1)?,
//     }

// }


// test test_fail () fail  {
//     expect 5 = increment(3, None) 
    
// }


// // Property testing
// test increment_property_test (n : Int via fuzz.int()){

//     increment(n, None) == n + 1

// }


// // test increment_property_test (n : Int via fuzz.int_between(1,4)){

// //     fuzz.label(
// //         when 1 => @"1"
// //         when 2 => @"2"
// //         when 3 => @"3"
// //         when 4 => @"4"
// //         - => @"Impossible"


// //     )
// //     increment(n, None) == n + 1

// // }

// /// Testing Failure : 
// // - Fail (all 100 fails )
// // - Fail once (not all fail ) -> PASS
// // test increment_property_test (
// //     ls : List<Int> via fuzz.list_between(fuzz.int(), 2, 2), 
// //     ) fail once {
// //         expect[n, step ] = ls
// //         increment(n, Some(step)) > n 

// // }



// // ls = [1,2,3] => [3,2,1] => [1,2,3]
// // reverse(reverse(value)) = value