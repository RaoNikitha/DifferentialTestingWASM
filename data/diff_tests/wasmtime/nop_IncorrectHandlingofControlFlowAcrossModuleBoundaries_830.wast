;; 1. Create a module that imports a function from another module and immediately follows the `call` instruction with a `nop`. Ensure the called function contains a sequence of operations with complex control flows like loops or conditionals. This checks if `nop` is correctly skipped without disrupting the flow control after a cross-module call.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $test
      (call $external_func)
      (nop)
    )
  )
  "type mismatch"
)