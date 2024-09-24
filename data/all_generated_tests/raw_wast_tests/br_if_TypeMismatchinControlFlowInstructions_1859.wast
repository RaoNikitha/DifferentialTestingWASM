;; 10. **Test Deeply Nested Type Confusion**:    - **Description**: Design complex nested control structures where `br_if` targets elswhere are assessed for type mismatches based on the depth and nesting.    - **Constraint Checked**: Ensures deep nesting does not introduce type mismatches in control flow transitions.    - **Relation to Type Mismatch**: Verifies consistency and integrity of operand types in deeply nested contexts.

(assert_invalid
 (module
  (func $deeply_nested_type_confusion
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (br_if 5 (i32.const 0))
                (nop)
              )
              (nop)
            )
            (nop)
          )
          (nop)
        )
        (nop)
      )
      (nop)
    )
  ))
 "type mismatch"
)