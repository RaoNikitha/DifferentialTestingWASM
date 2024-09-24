;; 6. **Test 6**:    - **Description**: Using `br_table` inside nested blocks where the depth of block index passed alters stack values before hitting a `call` instruction.    - **Constraint Checked**: Checks correct interpretation and handling of block depth and stack operations.    - **Relation to Block Nesting**: Ensures `br_table` correctly interprets the depth of nested blocks to manage control flow and stack values.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $test (result i32)
      (block (block (br_table 0 1 (i32.const 2)))
        (call 0 (i32.const 1))
      )
    )
    (func (param i32))
  )
  "type mismatch"
)