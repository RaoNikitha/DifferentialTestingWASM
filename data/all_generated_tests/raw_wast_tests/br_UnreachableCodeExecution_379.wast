;; 10. Create a nested `loop` structure where a `br` instruction's correct execution should loop back to the start of the loop, avoiding an embedded `unreachable` instruction within the loop's body.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (br 0)
        (unreachable)
      )
      (i32.const 42)
    )
  )
  "type mismatch"
)