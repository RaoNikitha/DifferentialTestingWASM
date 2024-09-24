;; Test Description 2: Create a function that takes multiple arguments (e.g., 3 integers) but returns only one value. Call this function and verify if the stack is correctly managed to consume the 3 arguments and push one return value correctly. Look for discrepancies in how the two implementations handle argument consumption and result pushing.

(assert_invalid
  (module
    (func $multi-args-single-ret (call 1 (i32.const 1) (i32.const 2) (i32.const 3)))
    (func (param i32 i32 i32) (result i32)
      local.get 0
    )
  )
  "type mismatch"
)