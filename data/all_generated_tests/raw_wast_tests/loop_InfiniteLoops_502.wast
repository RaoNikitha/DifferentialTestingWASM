;; 3. Implement a loop with an invalid backward branch that incorrectly manipulates the operand stack, leading to reevaluation of the loop condition that always results in an infinite loop.

(assert_invalid
  (module
    (func $infinite_loop
      (loop (result i32)
        (i32.const 1)
        (br 0)
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)