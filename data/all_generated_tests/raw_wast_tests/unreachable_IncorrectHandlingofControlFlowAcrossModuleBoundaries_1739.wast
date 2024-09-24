;; 10. **Test Description:**    Import a function that includes an `unreachable` instruction followed by a `return` instruction, and call this imported function in the main module's function. Verify whether both implementations handle the trap correctly without returning to the calling module.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func $test_unreachable
      (call $imported_func)
    )
  )
  "type mismatch"
)