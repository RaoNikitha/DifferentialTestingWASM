;; 2. **Loop with Immediate `br` to Break with Unreachable Code Inside:**    - Design a loop where a `br` instruction immediately breaks out of the loop and is followed by an `unreachable` instruction inside the loop.    - This ensures that the loop's `br` instruction correctly breaks the loop without hitting the `unreachable` instruction.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (br 0)
        unreachable
      )
    )
  )
  "type mismatch"
)