;; Test 6: Place `nop` in a function that utilizes the stack for complex arithmetic operations followed by a return, ensuring the stack's final state and return value is consistent and uncorrupted.

(assert_invalid
  (module (func (result i32) (i32.const 10) (i32.const 20) (i32.add) (nop) (return)))
  "type mismatch"
)