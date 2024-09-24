;; 3. Construct a function with `nop` placed right before a `return` statement. Validate that the return value is handled correctly and returned as expected, ensuring `nop` does not modify the return behavior.

(assert_invalid
  (module (func (result i32) (nop) (return (i32.const 42))))
  "type mismatch"
)