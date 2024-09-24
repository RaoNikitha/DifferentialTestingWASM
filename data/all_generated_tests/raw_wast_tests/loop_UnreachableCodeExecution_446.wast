;; Generate a loop with an immediate backward `br` instruction to the loop’s start, and place an `unreachable` after this `br`. Verify the `br` instruction correctly jumps back and never reaches the `unreachable`.

(assert_invalid
  (module (func $loop-with-br (result i32)
    (i32.const 0)
    (loop (result i32)
      (br 0)
      (unreachable)
    )
  ))
  "unreachable reached"
)