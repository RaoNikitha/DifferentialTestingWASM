;; Create a scenario where a `block` calls an imported function that itself contains a `block` with additional nested calls. Test if control flow properly manages the return to the outermost block and handles the operand stack accurately across multiple nestings and module boundaries.

(assert_invalid
  (module
    (import "wasm2" "func" (func $importedFunc (result i32)))
    (func (block (result i32)
      (call $importedFunc)
      (block (br 0 (call $importedFunc)))
    ))
  )
  "type mismatch"
)