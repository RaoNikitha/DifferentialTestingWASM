;; 1. Create a test with a deeply nested set of `block` instructions where a `br` instruction targets a middle layer block. This will test if the implementation correctly manages the relative label indices and exits the appropriate block.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (block
            (block
              (block
                (br 2)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)