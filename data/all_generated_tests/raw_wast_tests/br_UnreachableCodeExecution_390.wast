;; 1. A single `block` containing a `br` instruction targeting the outer scope, which leads to an `unreachable` instruction. This test checks if the `br` correctly exits the block and avoids the `unreachable` instruction.

(assert_invalid
  (module
    (func (result i32)
      (block
        (br 1)
      )
      unreachable
    )
  )
  "unknown label"
)