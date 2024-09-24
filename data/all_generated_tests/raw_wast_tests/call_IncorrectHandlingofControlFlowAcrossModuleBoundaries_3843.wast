;; 2. Export a function from one module and import it into another module. Call this function in a nested fashion, where the exported function itself calls another imported function. Check if the function indices are correctly handled across module boundaries without leading to any errors or incorrect execution flow.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $nested_call
      (call $exported_func (i32.const 42))
    )
    (func $exported_func (export "exported_func")
      (call $external_func (i32.const 10))
    )
  )
  "unknown function"
)