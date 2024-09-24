;; 7. **Test Scenario**: Implement a loop that conditionally returns within the loop body, followed by an unreachable instruction right after the loop.    **Constraint**: Confirms loop does not continue once a return is issued.    **Unreachable Code**: Verify if loop completion triggers unreachable.

(assert_invalid
  (module
    (func $loop-return-and-unreachable
      (loop
        (if (i32.const 1) (return))
        unreachable
      )
    )
  )
  "unreachable code"
)