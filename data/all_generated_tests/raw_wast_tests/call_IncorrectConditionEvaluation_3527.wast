;; 6. **Test Description:** Test a nested `call` sequence within conditional blocks where the first call's result affects the second call invocation. Differences in argument checking by `wizard_engine` should detect errors, while `WebAssembly` might not evaluate conditions correctly. Specific Constraint:** Nested conditional call handling.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then (call 1))
        (else (call 2)))
      (i32.const 0))
    (func (param i32))
    (func (result i32))
  )
  "type mismatch"
)