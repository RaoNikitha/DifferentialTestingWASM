;; 1. **Test with Mismatched Block Results**:    - Create a block with a mismatched result type, where the instructions within the block push incorrect types onto the stack based on the specified block type.    - Verify that one implementation correctly reports a stack type mismatch error while the other might silently corrupt the stack.

(assert_invalid
  (module (func $mismatched-block-result
    (block (result i32) (i64.const 1) (br 0))
  ))
  "type mismatch"
)