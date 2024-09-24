;; 1. **Test Description 1**:    Create a WASM module that imports a function from another module and performs a `br` operation to an outer block immediately after calling the imported function. Check if the operand stack remains consistent before and after the call.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (result i32)
      (block (result i32)
        (call $external_func)
        (br 1 (i32.const 0))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)