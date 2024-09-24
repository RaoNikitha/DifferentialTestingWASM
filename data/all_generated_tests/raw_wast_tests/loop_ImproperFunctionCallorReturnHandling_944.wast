;; 5. **Test Description 5**:    Implement a loop that calls a function using `call_indirect`, with different allowable function types in the indirect table. Ensure type checking is honored, and invalid types are not called, preventing improper execution paths.

(assert_invalid
  (module
    (table 1 funcref)
    (type $valid (func (param i32) (result i32)))
    (type $invalid (func (param f32) (result f32)))
    (func $callee (type $valid) (param i32) (result i32)
      local.get 0
    )
    (elem (i32.const 0) $callee)
    (func $test
      (loop (result i32)
        (i32.const 0)
        (call_indirect (type $invalid) (i32.const 0) (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)