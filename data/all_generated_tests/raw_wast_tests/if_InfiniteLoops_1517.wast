;; 8. **Conditionally Breaking Loop in `else` Branch**: Test an `if ... else` where the true condition represents normal execution, and the `else` contains `br_if` to break a loop. Ensure that the loop termination is handled correctly to avoid infinite execution.

(assert_invalid
  (module
    (func $cond-break-loop (result i32)
      (block $loop_block
        (loop $loop
          (if (result i32)
            (i32.const 0)
            (then (i32.const 1))
            (else (br_if 0 (i32.const 1)))
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)