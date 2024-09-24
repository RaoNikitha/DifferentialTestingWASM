;; 1. Test a WebAssembly module that calls an imported function with the `unreachable` instruction immediately after the call, ensuring the transition and trap occur as expected. This checks if stack handling and control flow return correctly to the importing module.

(assert_invalid
 (module
  (import "env" "external_func" (func $external_func (param i32)))
  (func $main
    (call $external_func (i32.const 42))
    (unreachable)
  )
 )
 "unreachable instruction"
)