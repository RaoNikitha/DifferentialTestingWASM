;; 1. Test a simple `if` instruction that checks a true condition and consumes an `i32` value from the stack. Evaluate differential behavior by comparing the resultant operand stack state between two implementations.

(assert_invalid
  (module (func $simple-true-condition
    (if (then) (i32.const 42))
  ))
  "type mismatch"
)