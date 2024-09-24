;; 4. **Test Description**: Define an `if` statement inside an exported function that conditionally calls an imported function and checks the result. The function should return different results based on the `if` condition evaluation.    - **Constraint Checked**: Correct handling of control flow when transitioning between different modules.    - **Test Relation**: Ensures that export-import return values align with the expected control flow logic.

(assert_invalid
  (module
    (import "env" "external_func" (func $ext_func (result i32)))
    (func (export "test_func") (result i32)
      (if (result i32) (i32.const 1)
        (then (call $ext_func))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)