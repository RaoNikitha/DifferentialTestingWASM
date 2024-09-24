;; 5. **Test 5**: Construct a block containing a `call` that pushes types onto the stack, followed by another block that consumes those types. Validate if nested blocks manage stack operations consistently and maintain proper type states after function calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result f64)))
    (func $func1 (result f64)
      (i32.const 42)
      (call 1)
      (call 1)
    )
    (func $func2 (param i32) (result f64)
      (i32.const 0)
    )
  )
  "type mismatch"
)