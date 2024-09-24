;; 5. **Test Nesting with Incorrect Typed Label Targets**:    - **Description**: Use nested `br_if` instructions targeting labels with mismatching result types.    - **Constraint Checked**: Verifies the correct interpretation and type validation of nested label results.    - **Relation to Type Mismatch**: Ensures correct label type resolution in nested control flows.

(assert_invalid
  (module 
    (func $nested-br_if-type-mismatch
      (block (result i32)
        (block (result f64)
          (br_if 1 (i32.const 1) (f64.const 1.0))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)