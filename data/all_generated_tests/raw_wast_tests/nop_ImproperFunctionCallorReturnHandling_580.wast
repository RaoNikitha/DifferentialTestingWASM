;; 1. Test a function with a single `nop` instruction followed by a `return` to ensure that `nop` does not alter the expected return value of the function.

(assert_invalid
  (module (func $test (result i32) (nop) (return (i32.const 0))))
  "type mismatch"
)