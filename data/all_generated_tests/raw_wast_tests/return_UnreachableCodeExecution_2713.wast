;; 2. **Test Scenario**: Implement a function using a loop where `return` is called within the loop and an unreachable instruction is placed right after the loop.    **Constraint**: Verifies `return` bypasses loop execution entirely.    **Unreachable Code**: Detect if control mistakenly exits loop and hits unreachable.

(assert_invalid
  (module
    (func $return-in-loop-unreachable
      (loop
        (return)
      )
      unreachable
    )
  )
  "type mismatch"
)