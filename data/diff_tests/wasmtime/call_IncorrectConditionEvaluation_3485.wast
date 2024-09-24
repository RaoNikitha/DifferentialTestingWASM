;; **Test 4**: Invoke an exported function from another module. Ensure the calling convention is maintained and verify if incorrect function indices lead to the correct trap handling.

(assert_invalid
  (module
    (import "env" "external" (func $external_func (param i32)))
    (func $test_func (call $external_func (i32.const 42)))
    (export "test" (func $test_func))
    (func (call 1))
  )
  "function index out of bounds"
)