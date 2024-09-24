;; 5. **Test for Conditional Execution with Multiple Returns**:    - Confirm that when an imported function with multiple return values is called inside an `if` block, the host module correctly receives all values and chooses the correct flow path based on the first return value.    - **Constraint Focus**: Validates multiple return value handling across module boundaries.

(assert_invalid
  (module
    (func $multi_return_test
      (import "env" "multi_return_function" (func (result i32 i64)))
      (if (result i32 i64) (i32.const 1)
        (then (call $multi_return_function))
        (else (i32.const 0) (i64.const 0))
      )
    )
  )
  "type mismatch"
)