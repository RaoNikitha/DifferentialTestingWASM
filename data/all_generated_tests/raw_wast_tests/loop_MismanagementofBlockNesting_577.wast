;; 8. **Multiple Level Loop with Unconditional Branch**:    Test a deeply nested loop scenario where an unconditional `br` misinterprets the loop depth.    This verifies the control flow accuracy, ensuring the correct loop level is branched to.

(assert_invalid
  (module
    (func $multi-level-loop-with-unconditional-branch
      (loop $outer (result i32)
        (i32.const 10)
        (loop $inner
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)