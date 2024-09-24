;; 6. **Test Description:**    Export a function that has an `unreachable` instruction embedded in a try-catch block. Import and call this function from another module to examine if the trap is consistently caught and handled the same way in both implementations.

(assert_invalid
  (module (func $test-unreachable-try-catch
    (try
      (do (unreachable))
      (catch_all (drop (i32.const 0)))
    )
  ) (export "test" (func $test-unreachable-try-catch)))
  "type mismatch"
)