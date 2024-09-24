;; - Test 7: Design a scenario where `call_indirect` intends to invoke a function that modifies the stack by leaving uninitialized or unexpected stack values. Verify that these stack values either get properly initialized or the operation traps. Check for any corruption due to uninitialized stack values.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
    (func $stack-uninitialized-values (result i32)
      (call_indirect (type 0) (i32.const 0))
      (i32.const 42) ;; Unused value, might cause stack corruption
    )
  )
  "type mismatch"
)