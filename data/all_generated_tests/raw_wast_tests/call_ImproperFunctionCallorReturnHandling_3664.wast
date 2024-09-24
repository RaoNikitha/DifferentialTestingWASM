;; 3. Nested function calls where the innermost function returns before all arguments for an outer function are consumed. Validate that argument handling across nested calls is correct.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      local.get 0
    )
    (func $outer (param i32 i32) (result i32)
      (local.get 0)
      (call $inner)
    )
    (func (param i32 i32)
      (call $outer (i32.const 10))
    )
  )
  "type mismatch"
)