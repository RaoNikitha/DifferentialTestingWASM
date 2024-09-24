;; 8. **Test for Cross-boundary Type Matching**:    - Validate calling an imported function within a module's `if` block that expects specific value types ensures both the input and output stack types match the defined blocktype after execution.    - **Constraint Focus**: Ensures type consistency across function calls between modules.

(assert_invalid
  (module
    (import "env" "func_i32_i32" (func $imported (param i32) (result i32)))
    (func $if-cross-boundary-type-matching (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call $imported (i32.const 1))
        )
        (else
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)