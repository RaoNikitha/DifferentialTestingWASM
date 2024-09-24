;; 2. Create a module that exports a function which calls another imported function. Then create a second module to import the exported function from the first module and call it. This test will verify if the call and return sequences are handled accurately, ensuring no stack corruption or execution flow issues when crossing module boundaries.

 ;; (module
  (import "env" "imp_func" (func $imp_func (param i32) (result i32)))
  (func $exported_func (param i32) (result i32)
    (call $imp_func (local.get 0))
  )
  (export "exported_func" (func $exported_func))
)

(assert_invalid
  (module
    (import "test" "exported_func" (func $exported_func (param i32) (result i32)))
    (func (result i32)
      (call $exported_func (i32.const 10))
    )
  )
  "type mismatch"
)