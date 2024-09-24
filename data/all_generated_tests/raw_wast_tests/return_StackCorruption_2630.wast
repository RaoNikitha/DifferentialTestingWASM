;; 9. A test where an exception is thrown and caught within a block, followed by a `return` instruction. This checks for proper stack unwinding in the presence of exception handling mechanisms.

(assert_invalid
  (module
    (try (result i32)
      (do (throw 0))
      (catch 0 (return))
    )
  )
  "type mismatch"
)