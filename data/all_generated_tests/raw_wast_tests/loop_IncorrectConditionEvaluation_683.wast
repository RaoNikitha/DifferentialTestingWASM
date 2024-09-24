;; 4. **Test Description 4**:    - Create a `loop` with a `br_if` that should stop branching if a counter on the stack reaches a certain value. Increment the counter within the loop and check if the loop exits as expected after a specified number of iterations, testing correct condition handling.

(assert_invalid
  (module
    (func $test
      (loop (result i32)
        (i32.const 0) ;; Initialize counter
        (loop
          (i32.const 1)
          (i32.add)
          (tee_local 0)
          (i32.const 10)
          (i32.ne)
          (br_if 0)
        )
      )
    )
  )
  "type mismatch"
)