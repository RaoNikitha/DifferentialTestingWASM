;; 10. **Test 10: Multiple Function Calls with `br_table` Leading to Unreachable**    - Call multiple functions with varying `br_table` targets where some lead to `unreachable`.    - **Reasoning:** Validates consistency in function call handling with `unreachable` target paths.    - **Constraint:** Tests integrated behavior across function calls and control transfer consistency.

(assert_invalid
  (module
    (func $f0 (param i32) (result i32) (unreachable))
    (func $f1 (param i32) (result i32) (block (result i32)
      (br_table 0 1 (local.get 0))
    ))
    (func $f2 (param i32) (result i32) 
      (call $f1 (local.get 0)) 
      (unreachable) 
      (i32.const 0)
    )
  )
  "type mismatch"
)