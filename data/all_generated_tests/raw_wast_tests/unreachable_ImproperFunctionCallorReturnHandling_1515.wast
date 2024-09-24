;; 6. Create a function with an `unreachable` instruction followed by a `call` to another function. Verify whether the `unreachable` traps execution correctly or if the call is inappropriately made.

(assert_invalid
  (module (func (unreachable) (call $dummy_func))
         (func $dummy_func))
  "unreachable instruction should trap before call")