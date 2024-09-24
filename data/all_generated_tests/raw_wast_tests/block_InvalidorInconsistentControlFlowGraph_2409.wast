;; 10. **Erroneous Stack Cleanup on Block Exit**:    - Devise a block that improperly cleans up the stack upon exiting, not matching the expected block result type and operand states.    - This assesses stack management at block boundaries and CFG integrity during exit transitions.

(assert_invalid
  (module (func $erroneous-stack-cleanup
    (block (result i32) (i32.const 42) (br 0 (f64.const 3.14)))
  ))
  "type mismatch"
)