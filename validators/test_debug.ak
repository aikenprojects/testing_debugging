use cardano/assets.{PolicyId}
use cardano/transaction.{Transaction}
use cardano/script_context.{ Publishing, Withdrawing, ScriptContext}



validator td {
    mint (reedemer: Int, _policy_id: PolicyId, _tx: Transaction){
        trace @"Reedemer": reedemer
        (reedemer==42)?
    }

        // ScriptContext: {
        //     transaction: Transaction,
        //     reedemer: Reedemer,
        //     info: ScriptInfo
        // }
        else(ctx : ScriptContext){
            // like switch case
            when ctx.info is {
                Withdrawing { .. } | Publishing { .. }  -> True

                _ -> fail @"Unsupported"
            }
            // fail
        }
    
}


// test test_validator_td(){
//     td.mint(42, "", transaction.placeholder)
// }

// test test_validator_td_2(){
//     !td.mint(41, "", transaction.placeholder)
// }

// test test_validator_td_3(){
//     td.else(
//         ScriptContext: {
//             transaction: transaction.placeholder,
//             reedemer: 42,
//             info: Withdrawing(VerificationKey(" "))
//         }
//     )
// }


// test test_validator_td_4() fail{
//     td.else(
//         ScriptContext: {
//             transaction: transaction.placeholder,
//             reedemer: 42,
//             info: Voting(StakePool(" "))
//         }
//     )
// }


// test test_validator_td_5(n: Int via fuzz.int()) fail{
//     td.else(
//         ScriptContext: {
//             transaction: transaction.placeholder,
//             reedemer: n,
//             info: Withdrawing(VerificationKey(" "))
//         }
//     )
// }