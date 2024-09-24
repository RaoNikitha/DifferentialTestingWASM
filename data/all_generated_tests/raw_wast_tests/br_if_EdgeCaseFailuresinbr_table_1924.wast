;; 5. **Test Conditional Branch (br_if) Following `br_table`**:    - **Description**: Execute a `br_if` instruction immediately after a `br_table` to observe stack behaviour.    - **Reasoning**: Confirms stack state consistency after complex branching.    - **Edge Relation**: Tests the consequential effects of `br_table` on subsequent conditional branches.

(assert_invalid
  (module (func $conditional-branch-following-br-table (result i32)
    (block (result i32)
      (block (br_table 0 (i32.const 0)))
      (br_if 0 (i32.const 1))
      (i32.const 1)
    )
  ))
  "type mismatch"
)