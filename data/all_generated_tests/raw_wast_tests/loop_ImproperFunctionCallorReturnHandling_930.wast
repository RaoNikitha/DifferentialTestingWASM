;; 1. **Test Description:**    A loop with a nested function call where the function signature does not match the expected block type. This checks if the loop correctly validates function signatures.

(assert_invalid
  (module (func $nested_func (param i32) (result i32)
    (i32.const 0)
  )
  (func $test_loop
    (loop (result i32)
      (call $nested_func) 
      (i32.const 1) 
    )
  ))
  "type mismatch"
)