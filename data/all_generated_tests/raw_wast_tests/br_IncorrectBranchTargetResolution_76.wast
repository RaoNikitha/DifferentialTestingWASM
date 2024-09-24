;; 7. Build a test with blocks interleaved with if-else constructs, where a `br` instruction targets an if block deep within the structure. Check if the branch avoids incorrectly jumping into neighboring else blocks.

(assert_invalid
  (module
    (func
      (block
        (block
          (if (then
            (block
              (block
                (br 1)
              )
            )
            (else
              (br 1)
            )
          ))
        )
      )
    )
  )
  "type mismatch"
)