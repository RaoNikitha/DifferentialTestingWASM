;; A test that checks correct operand stack height maintenance when an `if` block conditionally returns from a function (`return`), comparing expected results between `if` and `else` branches to verify consistency with blocktype specifications.

(assert_invalid
  (module (func $test-stack-height (param i32) (result i32)
    (if (result i32)
      (i32.const 1)
      (then
        (return (i32.const 42))
      )
      (else
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)