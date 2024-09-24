;; 1. **Test Calling Imported Function with Return**:    - Description: Create a WASM module that imports a function which does nothing but return immediately. Call this imported function multiple times within a loop in the exporting module. Check if the operand stack remains consistent across multiple calls.    - Constraint: Validate that the operand stack is correctly maintained across module boundaries during function calls and returns.

(assert_invalid
  (module
    (import "env" "external_return" (func $external_return (result i32)))
    (func $test_import_return (result i32)
      (local $i i32)
      (local.set $i (i32.const 10))
      (block (loop
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (call $external_return)
        (br_if 1 (i32.eqz (local.get $i)))
        (br 0)
      ))
      (call $external_return)
      (return)
    )
  )
  "type mismatch"
)