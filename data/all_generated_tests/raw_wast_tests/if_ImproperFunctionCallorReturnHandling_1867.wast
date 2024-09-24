;; A test with `if` and `else` branches where each branch calls the same function (`call`) but with different parameter values, ensuring the operand stack and control flow correctly handle multiple branches with the same function call.

(assert_invalid
  (module (func $test-func (param i32) (result i32)
    (if (result i32) (i32.const 1)
      (then (call $test-func (i32.const 50)))
      (else (call $test-func (i32.const 100)))
    )
  ))
  "type mismatch"
)