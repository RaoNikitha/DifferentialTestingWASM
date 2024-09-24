;; 8. **Test 8: Asynchronous Call and Return Handling**    - Description: Simulate asynchronous function calls across modules and verify the handling of return instructions to ensure no stack corruption or flow issues occur.    - Relation: Relevant for ensuring correct asynchronous execution flow across module boundaries with return instructions.

(assert_invalid
  (module
    (func $async-call (result i32)
      (call $dummy)
      (return (i32.const 1))
    )
    (func $dummy (result i32)
      (return (i32.const 2))
    )
  )
  "type mismatch"
)