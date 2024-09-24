;; 1. Create a block with nested loops. Use a `br` instruction to jump to an undefined label index within the block, which should result in the `unreachable` instruction being reached if the label index is mishandled in one of the implementations.

(assert_invalid
  (module
    (func $invalid-br-label
      (block 
        (loop 
          (br 3)
        )
      )
    )
  )
  "unknown label"
)