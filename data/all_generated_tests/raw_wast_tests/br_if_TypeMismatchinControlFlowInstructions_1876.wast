;; 7. **Test 7**:    - **Description**: Usage of `br_if` within varying depths of nested control instructions (blocks, loops) where the innermost expects specific types (`f64`), and the `br_if` provides a different type.    - **Constraint**: Checks type adherence relative to the depth of nested structures.    - **Relation to Type Mismatch**: Validates type matching through the depth of control flow nesting and correct unwinding.

(assert_invalid
  (module (func $nested-type-mismatch 
    (block (result f64)
      (loop 
        (block 
          (br_if 2 (i32.const 1)) 
        )
      )
    )
  ))
  "type mismatch"
)