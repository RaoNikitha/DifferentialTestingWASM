;; 4. Create a sequence of nested `block` instructions where a `br` targets a label that, if incorrectly handled, redirects control flow into an `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (unreachable)
          (br 0)
        )
      )
      (nop)
    )
  )
  "unknown result type"
)