;; 6. **Test Description:**    A sequence where a loop calls a function which itself contains a loop with mismatched block types. This test ensures that nested loop and function call handling are consistent across implementations.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $foo (param i32) (result i32)
      (loop (result f32) (nop))
      (i32.const 0)
    )
    (func $type-mismatch-loop-call
      (i32.const 1)
      call $foo
      (loop (result i32) (nop))
    )
  )
  "type mismatch"
)