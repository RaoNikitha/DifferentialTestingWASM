;; 1. Create a test where `unreachable` is placed immediately after an `i32.add` instruction. Check if the stack is correctly handled and if the same trap behavior is observed when the additional operand is not consumed.

(assert_invalid
  (module (func (i32.const 1) (i32.const 2) i32.add unreachable (i32.const 3)))
  "type mismatch"
)