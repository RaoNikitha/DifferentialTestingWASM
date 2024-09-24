;; 6. Implement a function with `try` and `catch` blocks where the `catch` block contains an `unreachable` instruction, ensuring the function traps when the `catch` block is executed.

(assert_invalid
  (module
    (func $type-try-catch-unreachable
      (try
        (do (drop (i32.const 0)))
        (catch (unreachable))
      )
    )
  )
  "type mismatch"
)