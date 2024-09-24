;; 2. Nested `blocks` with a `br` instruction in the innermost block targeting an outer block, followed by an `unreachable` instruction inside the inner block. This verifies correct relative label indexing.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 2)
            unreachable
          )
        )
      )
    )
  )
  "type mismatch"
)