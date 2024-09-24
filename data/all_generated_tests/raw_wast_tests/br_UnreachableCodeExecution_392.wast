;; 3. A `loop` with a `br` instruction inside targeting itself, followed by an `unreachable` instruction. This tests backward branching to ensure it does not inadvertently hit the `unreachable`.

(assert_invalid
  (module
    (func (loop (result i32)
      (br 0)
      (unreachable)
    ))
  )
  "type mismatch"
)