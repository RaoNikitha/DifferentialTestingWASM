;; 9. **Parameter Constraints for Nested If**:    - Nest an `if` block inside another, with mismatched types between inner and outer `if` block's declared types.    - Ensures nested blocks enforce consistent typing based on their declared `blocktypes`.    - **Constraint**: Validation of nested `if` blocks must strictly propagate type contexts.

(assert_invalid
  (module
    (func $nested-if-mismatched-types
      (if (result i32)
        (i32.const 1)
        (then 
          (if (result i64) 
            (i32.const 1)
            (then (i64.const 2))
          )
        )
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)