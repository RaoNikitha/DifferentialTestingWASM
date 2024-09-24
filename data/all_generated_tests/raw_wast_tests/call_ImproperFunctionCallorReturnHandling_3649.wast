;; 8. **Test Description**: Invoke a function that intentionally consumes more arguments from the stack than allocated, testing for incorrect stack operations.

(assert_invalid
  (module
    (func $consume-more-args (param i32))
    (type $sig (func (param i32) (result i32)))
    (func $test (result i32)
      (i32.const 1)
      (i32.const 2)
      (call $consume-more-args)
    )
  )
  "type mismatch"
)