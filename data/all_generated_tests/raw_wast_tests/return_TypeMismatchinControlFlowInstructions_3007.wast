;; 6. **Mismatched Block Return after Nested Calls**:    - Have a block call several nested functions returning varying types (`i32`, `i64`) but end with a `return` expected to yield only `i32`.    - **Constraint:** Ensures that the stack state and types are consistent post function calls within a block.    - **Type Mismatch:** Examines the return type consistency following multiple nested function calls.

(assert_invalid
  (module
    (func $nested-call-1 (result i32)
      (i32.const 42)
    )
    (func $nested-call-2 (result i64)
      (i64.const 84)
    )
    (func $mismatched-return-after-nested-calls (result i32)
      (block
        (call $nested-call-1)
        (call $nested-call-2)
        (return)
      )
    )
  )
  "type mismatch"
)