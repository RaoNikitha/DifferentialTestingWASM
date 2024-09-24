;; **Test 4:** Create a WASM module with a function that includes a `block` using a branch instruction (`br`) targeting an imported function. Verify if the label and stack state are correctly adjusted when the branch crosses module boundaries, focusing on accurate label and stack management.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (block (result i32)
        (br 0 (call $external_func))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)