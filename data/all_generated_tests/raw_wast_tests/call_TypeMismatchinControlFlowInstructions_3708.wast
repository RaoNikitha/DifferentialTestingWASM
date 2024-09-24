;; 7. **Test 7: Loop Result Type Mismatch**:    - **Test Description**: Define a loop with a specific result type but include a call within the loop that produces a different type.    - **Constraint**: Ensures that loop result types from calls are correctly validated.    - **Type Mismatch**: The loop should produce an error when the call result types don't match.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $callee (result i32) (i32.const 0))
    (func $type-loop-result-mismatch
      (result i64)
      (loop
        (call $callee)
      )
    )
  )
  "type mismatch"
)