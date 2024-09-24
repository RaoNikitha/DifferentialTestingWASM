;; 8. Construct a `loop` within another `loop`, where the inner loop has a `br 2` instruction to test if it breaks out of both loops correctly. This tests proper backward branch behavior and nested loop management.

(assert_invalid
  (module
    (func $nested-loops
      (loop (result i32)
        (loop
          (i32.const 0)
          (br 2)
        )
      )
    )
  )
  "unknown label"
)