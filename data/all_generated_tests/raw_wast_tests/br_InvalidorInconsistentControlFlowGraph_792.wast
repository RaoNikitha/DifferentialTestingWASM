;; Create a function with several nested `block` structures with varying depths. Insert a `br` instruction targeting a deeply nested block to ensure the relative indexing is handled correctly. Testing for: Accurate relative label indexing and CFG generation in deeply nested block structures to avoid misinterpretation of branch targets.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (block
              (block
                (block
                  (br 6)
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)