;; 2. **Unmatched `call_indirect` Inside Block**:    - **Description**: Within a block, use a `call_indirect` instruction with an incorrect function type. Check if the block correctly detects the type mismatch and handles it accordingly.    - **Constraint**: Ensure type indexing and matching within `call_indirect`.    - **Improper Handling**: The block might incorrectly attempt to execute a mismatched function type, leading to execution errors.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (func (result i32)
      (block (result i32)
        (i32.const 0)
        (call_indirect (type $t1) (i32.const 1) (type $t1)) ;; Incorrect type usage
      )
    )
  )
  "type mismatch"
)