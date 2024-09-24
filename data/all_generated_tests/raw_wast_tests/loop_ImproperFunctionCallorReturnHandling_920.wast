;; 1. **Test Case**: Create a loop that calls a function within the loop body multiple times, ensuring the function call occurs in the context of deeply nested loops.    - **Constraint Check**: Ensure proper handling of function calls within nested loops.     - **Improper Function Call or Return Handling**: Mismanagement of the return address from the called function within multiple nested loops.

(assert_invalid
  (module 
    (func $nested-loop-function-call (result i32)
      (i32.const 0) 
      (loop (result i32)
        (i32.const 1) 
        (i32.add)
        (call $dummy-function) 
        (br_if 0 (i32.const 0))
      )
    )
    (func $dummy-function (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)