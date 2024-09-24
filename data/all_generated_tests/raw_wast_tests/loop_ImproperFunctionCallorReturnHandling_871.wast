;; 2. **Test Description**: A `loop` containing multiple `call_indirect` instructions, each targeting different functions with different return types.    - **Constraint**: Ensures that `call_indirect` resolves the correct function and respects the return types expected by the loop.    - **Improper Handling**: Incorrect function resolution or type mismatch leads to unintended function execution or invalid type errors. -

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (result f64)))
    (func $func1 (result i32) (i32.const 42))
    (func $func2 (result f64) (f64.const 3.14))
    (table 4 anyfunc)
    (elem (i32.const 0) $func1 $func2)
    (func $test
      (loop (result i32)
        (call_indirect (type $sig1) (i32.const 0))
        (call_indirect (type $sig2) (i32.const 1))
        (br 1)
      )
    )
  )
  "type mismatch"
)