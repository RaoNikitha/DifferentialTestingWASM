;; 9. **Test 9**:    - **Description**: Validate an `if` block calling a function that in turn calls another function, verifying chained function returns.    - **Constraint**: Confirm that multi-layer function call returns properly unwind and stack values reflect the chain accurately.    - **Relation**: Evaluates the handling of chained function calls within an `if` block and accurate return value management.

(assert_invalid
  (module
    (func $callee1 (result i64) (i64.const 42))
    (func $callee2 (result i64) (call $callee1))
    (func $test (result i64)
      (if (result i64)
        (i32.const 1)
        (then (call $callee2))
        (else (i64.const 0))
      )
    )
  )
  "type mismatch"
)