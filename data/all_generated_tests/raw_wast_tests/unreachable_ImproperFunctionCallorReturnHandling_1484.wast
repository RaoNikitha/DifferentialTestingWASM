;; 5. Use a sequence of nested function calls where only one deeply nested function contains an `unreachable` instruction. Check if the trap propagates back through the call stack in both implementations.

(assert_invalid
  (module
    (func $deep_nested
      (block
        (block
          (unreachable)
        )
      )
    )
    (func $call_deep_nested
      (call $deep_nested)
    )
    (func $test
      (call $call_deep_nested)
    )
  )
  "unreachable"
)