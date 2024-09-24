;; 7. Design a test where an exported function contains a manual stack manipulation prior to calling an imported function. This can reveal whether the stack modifications are correctly preserved when the control flow passes across module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32)))
    (func $test
      (i32.const 42)
      (call $imported_func)
    )
    (func $exported (export "test")
      (i32.const 1)
      (i32.const 2)
      (call $test)
    )
  )
  "type mismatch"
)