;; 5. **Skipping Function Call due to Early Return**:    Create a test where an early return within a function causes certain call instructions placed after the return statement to potentially not execute. This checks if the CFG properly handles paths where the execution might skip over these calls.

(assert_invalid
  (module
    (func $early-return
      (param i32 i32)
      (return)
      (call 1)
    )
    (func (param i32))
  )
  "unreachable code"
)