;; 2. **Test Description**:    - Design a `loop` with nested `br_table` that has multiple branch targets and ensure the index exactly matches the highest valid target. The test checks if `br_table` branches correctly to the highest indexed target.    - **Constraint Checked**: Correct indexing and branching to the highest valid target in `br_table`.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (loop (result i32)
        (local.set 0 (i32.const 3))
        (br_table 0 1 2 (local.get 0))
      )
    )
  )
  "type mismatch"
)