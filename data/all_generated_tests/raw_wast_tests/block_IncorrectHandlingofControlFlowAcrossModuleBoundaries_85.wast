;; **Test 6:** Construct a WASM module with nested exported functions involving `block` instructions. Import these functions in another module, and create nested calls using both `call` and `call_indirect`. This tests for proper context and control flow transitions across module boundaries with multiple nested levels.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (result i32)))
    (func $nested (param i32)
      (block (result i32)
        (call $func1)
        (call_indirect (type $nested) (i32.const 0))
      )
    )
  )
  "type mismatch"
)