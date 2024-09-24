;; 7. Test `nop` placement directly before and after an `unreachable` instruction within a function, verifying that `nop` disrupts neither error traps nor the expected termination behavior, signaling improperly handled CFG cases.

(assert_invalid
  (module (func $control-flow-test 
    unreachable 
    nop 
    i32.const 1 
    nop))
  "unreachable instruction did not terminate")
