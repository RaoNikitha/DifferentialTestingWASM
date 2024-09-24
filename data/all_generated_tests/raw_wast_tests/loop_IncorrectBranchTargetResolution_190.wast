;; 1. Create a loop with nested loops, and place a `br` instruction targeting the innermost loop. The test checks if the `br` correctly resolves to the intended loop and restarts it, ensuring correct label indexing and resolution.

(assert_invalid
  (module
    (func $nested_loop_with_br
      (loop (result i32)
        (loop
          (br 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)