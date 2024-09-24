;; 4. **Test Description**: Construct a block with `typeidx` that returns multiple values and use `br_if` that checks a condition on one of these values.    - **Constraint Checked**: Tests handling of multi-value returns in blocks and condition-based branching.    - **Relation to Condition Evaluation**: Mismanagement of multi-value stack or condition checks could affect correct branching.

(assert_invalid
  (module
    (type (func (result i32 f32)))
    (func (result i32 f32)
      (block (type 0)
        (i32.const 42)
        (f32.const 1.23)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)