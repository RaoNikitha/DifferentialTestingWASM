;; 5. Define a test with alternating `block` and `loop` structures. Add a `br` to an invalid label index, causing a misinterpreted backward branch resulting in reaching an `unreachable` instruction.

(assert_invalid
  (module
    (func
      (block 
        (loop 
          (block 
            (br 3) 
            (unreachable)
          )
        )
      )
    )
  )
  "unknown label"
)