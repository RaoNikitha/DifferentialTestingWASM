;; Test 7: Create a `loop` with an `if` inside it, and place a `br` instruction within the `if` to target the beginning of the loop. This checks the correct handling of a backward branch from a conditional structure within a loop.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)