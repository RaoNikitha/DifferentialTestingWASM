;; **Test 8:** Generate a WASM module where a `block` instruction encompasses a `call` to an imported function, which itself contains a `block` that returns a non-trivial value. Import and use this function in another module, validating the correct propagation of stack state and return values across boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_func (result i32)
      (block (result i32)
        (call $external_func)
        (i32.const 1)
      )
      (i32.add)
    )
  )
  "type mismatch"
)