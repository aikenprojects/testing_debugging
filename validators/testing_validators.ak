use aiken/fuzz
use cardano/address.{VerificationKey}
use cardano/governance.{StakePool}
use cardano/script_context.{ScriptContext, Voting, Withdrawing}
use cardano/transaction.{Transaction}
use test_debug

test test_validator_td() {
  test_debug.td.mint(42, "", transaction.placeholder)
}

test test_validator_td_2() {
  !test_debug.td.mint(41, "", transaction.placeholder)
}

test test_validator_td_3() {
  test_debug.td.else(
    ScriptContext {
      transaction: transaction.placeholder,
      redeemer: 42,
      info: Withdrawing(VerificationKey(" ")),
    },
  )
}

test test_validator_td_4() fail {
  test_debug.td.else(
    ScriptContext {
      transaction: transaction.placeholder,
      redeemer: 42,
      info: Voting(StakePool(" ")),
    },
  )
}

test test_validator_td_5(n: Int via fuzz.int()) {
  test_debug.td.else(
    ScriptContext {
      transaction: transaction.placeholder,
      redeemer: n,
      info: Withdrawing(VerificationKey(" ")),
    },
  )
}
