;; 7. Use `call_indirect` to perform a valid call, but then manipulate the operand stack in a way that changes the expected return type after the function is called. Test the implementation’s handling of post-call stack return values.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $expected (func (result f64)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      local.get 0
    )
    (func (result f64)
      i32.const 0
      i32.const 42
      call_indirect (type $sig)
      f32.convert_i32_s
    )
  )
  "type mismatch"
)