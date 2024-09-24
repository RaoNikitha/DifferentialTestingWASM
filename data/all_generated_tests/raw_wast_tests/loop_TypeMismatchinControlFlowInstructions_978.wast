;; 9. **Test 9: Type Mismatch due to External Function Call within Loop**    - Description: Call an external function within a loop that modifies the stack's types in a way that conflicts with the loop's block type declarations.    - Reasoning: This tests integration with external functions and the enforcement of type constraints even when the stack is modified by external calls within loops.

(assert_invalid
  (module
    (func $external (result i64) (i64.const 42))
    (func $type-mismatch-loop (result i32)
      (loop (result i32)
        (call $external)
        (i32.wrap_i64)
      )
    )
  )
  "type mismatch"
)