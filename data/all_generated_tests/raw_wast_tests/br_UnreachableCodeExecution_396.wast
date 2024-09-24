;; 7. A structure involving a `loop` within a `block` where a `br` targets the loop from the block, with an `unreachable` instruction following the `loop`. This tests correct handling of backward branching within mixed control constructs.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 1)
        )
        unreachable
      )
    )
  )
  "type mismatch"
)