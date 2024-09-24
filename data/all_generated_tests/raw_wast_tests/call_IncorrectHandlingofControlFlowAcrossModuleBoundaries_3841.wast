;; 10. Construct a use case where asynchronous operations are simulated within an imported function and the function is called from an exported function of another module. This will test the preservation of control flow during asynchronous wait and resume states across module boundaries.

(assert_invalid
  (module
    (import "env" "async_func" (func $async_func (param i32) (result i32)))
    (func (export "main")
      (call $async_func (i32.const 42))
    )
  )
  "type mismatch"
)