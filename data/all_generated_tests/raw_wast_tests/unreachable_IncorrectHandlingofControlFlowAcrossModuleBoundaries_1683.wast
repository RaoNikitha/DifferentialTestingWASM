;; 4. Design a test involving multiple chained calls across different modules, with one function in the sequence containing an `unreachable` instruction. Verify that the trap propagates properly through the chain without breaking control flow.

(assert_invalid
  (module
    (import "mod1" "func1" (func $func1 (result i32)))
    (func $type-module-import-call-unreachable (result i32)
      (call $func1)
      (unreachable)
    )
  )
  "type mismatch"
)