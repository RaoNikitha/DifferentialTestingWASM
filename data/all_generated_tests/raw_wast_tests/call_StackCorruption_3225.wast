;; 4. Test multiple consecutive calls to functions with varying numbers of input arguments and return values. Ensure that after each call, the stack's expected size and contents are as intended.

(assert_invalid
  (module
    (func $multi-call-test
      (call 0) (call 1)
    )
    (func (result i32 i32)
      i32.const 1 i32.const 2
    )
    (func (param i32 i32) (result i32)
      local.get 0
    )
  )
  "type mismatch"
)