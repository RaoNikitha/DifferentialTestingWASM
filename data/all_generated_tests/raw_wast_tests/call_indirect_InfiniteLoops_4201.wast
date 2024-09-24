;; 10. **Test Description**: Verify a module that uses `call_indirect` within nested loops and where correct loop termination depends on the return status from the indirect call. Function type mismatches or stack operation errors, if incorrectly handled, would cause infinite looping conditions.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $loop-body (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.const 1))
      (block $outer
        (loop $inner
          (br_if $outer (i32.eqz (local.get 1)))
          (local.set 1 (call_indirect (type 0) (local.get 0)))
          (br $inner)
        )
      )
      (local.get 1)
    )
    (func (export "test")
      (i32.const 0)
      (call $loop-body)
      drop
    )
  )
  "type mismatch"
)