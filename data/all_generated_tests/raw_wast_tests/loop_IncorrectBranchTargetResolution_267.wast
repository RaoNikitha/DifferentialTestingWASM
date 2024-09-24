;; 8. **Loop with Early Exit Branch**:    Implement a loop with a branch instruction (`br`) that targets an early exit (label outside the loop). Confirm the target label is not mistaken for an incorrect nested label.

(assert_invalid
  (module
    (func $loop-with-early-exit
      (block $exit
        (loop
          (br $exit)
        )
      )
    )
  )
  "type mismatch"
)