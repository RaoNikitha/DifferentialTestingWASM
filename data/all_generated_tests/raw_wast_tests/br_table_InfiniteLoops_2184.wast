;; 4. **Test 4: Operand Out of Bounds Handling**    - **Description**: Construct a loop with a `br_table` using an operand index out of bounds and set up a condition to check operand index branching consistently.    - **Constraint**: Tests if out-of-bounds operand indexes correctly default to the specified label.    - **Infinite Loop Relation**: Incorrect out-of-bounds handling might improperly redirect looping, leading to an infinite loop.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (br_table 0 1 2 (local.get 0))
      )
    )
  )
  "unknown label"
)