;; 7. **Test 7**: `call_indirect` within nested functions:    - Define multiple functions where the `call_indirect` is used inside nested blocks and loops of these functions.    - Confirm the proper execution without confusing nested function returns with nests in the current function.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $nested_func
      (loop
        (block
          (call_indirect $sig1 (i32.const 0) (i32.const 1))
        )
        (call_indirect $sig2 (i32.const 0) (i32.const 2) (i32.const 3))
      )
    )
    (table funcref (elem))
  )
  "type mismatch"
)