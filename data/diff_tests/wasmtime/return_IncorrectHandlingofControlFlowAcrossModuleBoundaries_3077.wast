;; 6. **Test 6: Import and Return Multi-Value Functions**    - Description: Import functions from another module that return multiple values and check the calling function’s ability to handle these multiple return values.    - Relation: Check for stack consistency and correct multiple value returns across module boundaries.

(assert_invalid
  (module
    (import "mod" "multi_return" (func $multi_return (result i32 i32)))
    (func $test_return (result i32 i32)
      (call $multi_return)
      (return (return))
    )
  )
  "type mismatch"
)