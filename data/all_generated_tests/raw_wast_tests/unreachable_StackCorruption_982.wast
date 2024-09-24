;; 3. Design a loop that contains an `unreachable` instruction randomly within its body. The test ensures the loop correctly terminates and does not continue executing instructions after `unreachable`, maintaining the stack state.

(assert_invalid
  (module (func (loop (unreachable) (i32.const 1) (br 0))))
  "type mismatch"
)