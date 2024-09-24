;; Test calls to imported and local functions in various orders and combinations. This verifies that the stack operations are correctly managed for both imported and internally defined functions.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32 i32)))
    (func $test (call $external_func (i32.const 1) (nop) (i32.const 2)))
  )
  "type mismatch"
)