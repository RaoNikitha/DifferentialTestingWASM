;; Test 1: A module with a function that includes a loop which branches to an imported function. This test checks if the implicit label handling in WebAssembly correctly manages the stack context during this cross-module branch, whereas the Wizard Engine’s explicit method might mishandle the label.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (loop (br 1) (call $external_func) end))
  )
  "type mismatch"
)