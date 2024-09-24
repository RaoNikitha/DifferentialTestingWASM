;; 3. **Return in Loops with Early Exit**:    - Design a function with a loop structure that conditionally returns early from within the loop. The test will verify if the CFG correctly manages early exits from within loops, ensuring subsequent instructions are not executed mistakenly.

(assert_invalid
  (module
    (func $return-in-loop-with-early-exit (result i32)
      (loop (result i32)
        (i32.const 0)
        (br_if 0 (return (i32.const 42)))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)