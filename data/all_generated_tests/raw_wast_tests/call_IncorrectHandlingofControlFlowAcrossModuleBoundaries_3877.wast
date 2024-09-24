;; 6. **Simultaneous Execution of Calls with Different Signatures**:    - **Constraint Checked**: Verifies the handling of multiple concurrent calls with different argument types and counts.    - **Description**: Define several functions with different signatures. Export these from module A and import them into module B. Call them simultaneously from module B, ensuring the argument types and counts are handled properly and stack state remains consistent.

(assert_invalid
  (module
    (import "A" "func1" (func $func1 (param i32)))
    (import "A" "func2" (func $func2 (param i64) (result i64)))
    (func (call $func1 (i64.const 42)) (call $func2 (i32.const 10)))
  )
  "type mismatch"
)