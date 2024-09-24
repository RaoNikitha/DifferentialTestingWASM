;; 7. Test function call with mismatched expected return type:    - Call a function and attempt to consume a different type or number of return values than provided by the function.    - Check if the implementations detect and handle the type mismatch, producing consistent error handling.

(assert_invalid
  (module
    (func $func (result i32) (i32.const 42))
    (func (result f64)
      (call $func) (return)
    )
  )
  "type mismatch"
)