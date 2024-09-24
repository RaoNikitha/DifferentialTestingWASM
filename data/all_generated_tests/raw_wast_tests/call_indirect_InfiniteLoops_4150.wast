;; 9. **Test Description 9**:    - Use a `loop` with a `call_indirect` where the loop condition depends on the result of the indirect call. An invalid function reference prevents exiting, thus creating an infinite loop.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type $sig1 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (param i32) (result i32)
      (local.get 0)
    )
    (func (param i32) (result i32)
      (local.get 0)
      (loop (result i32)
        (call_indirect (type $sig1) (i32.const 1) (i32.const 0))
        (if (result i32)
          (i32.const 0)
          (then (br 1))
        )
      )
    )
    (export "test" (func 1))
  )
  "type mismatch"
)