;; ### Differential Test Descriptions  1. A test with a `loop` instruction inside a function that calls an imported function, which itself calls back into the original module in a nested fashion. This checks whether the loop correctly maintains the stack and context through multiple cross-module function calls.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32)))
    (func $callback (result i32)
      (call_import 0)
      (call 1))
    (func $test
      (loop (result i32)
        (call $imported)
        (br 0))
    )
  )
  "type mismatch"
)