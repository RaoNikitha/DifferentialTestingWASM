;; 8. Attempt to call a function using an index that is valid in another module but not in the current one, ensuring the error handling does not corrupt the stack in the WebAssembly implementation.

(assert_invalid
  (module
    (import "moduleB" "valid_func" (func $valid_func (param i32) (result i32)))
    (func $caller (call 0))
  )
  "unknown function"
)