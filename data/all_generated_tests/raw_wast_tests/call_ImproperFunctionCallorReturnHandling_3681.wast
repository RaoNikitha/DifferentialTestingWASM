;; 10. **Test Crash Recovery and Error Propagation**:    - Purposefully induce a fault in a nested call and verify the consistency and recovery of the calling context.    - **Constraint**: Correct handling of traps and crash recovery.    - **Improper Call Handling**: The context might not properly handle the exception leading to undefined behavior.

(assert_invalid
  (module
    (func $type-crash-recovery (call 1))
    (func (result i32) (unreachable) (return (i32.const 0)))
  )
  "type mismatch"
)