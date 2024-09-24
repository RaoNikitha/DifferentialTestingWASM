;; **Test 3:** Define a WASM module that exports a function encapsulated by a `block` with a `valtype?`. Import the function in another module and call it using `call_indirect` within another `block`. This checks for the proper handling of block type changes and stack context across module entries and exits.

(assert_invalid
  (module
    (func $exportedFunc (export "exportedFunc")
        (block (result i32)
            (i32.const 10)
        )
    )
  )
  (import "env" "exportedFunc" (func $importedFunc (result i32)))
  (func (block
      (call_indirect (type (func (result i32))) (i32.const 0) (i32.const 0))
  ))
)