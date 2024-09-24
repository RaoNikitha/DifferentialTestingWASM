;; 2. Define a sequence with deeply nested `if` statements, each with a unique label index. Insert a `br` instruction to a non-existent label, causing a jump to an `unreachable` instruction due to misinterpretation of the relative label indexing.

(assert_invalid
  (module
    (func $nested_if_br
      (block
        (if (result i32)
          (then
            (i32.const 1)
            (block
              (if (result i32)
                (then
                  (i32.const 2)
                  (block
                    (if (result i32)
                      (then
                        (i32.const 3)
                        (block
                          (if (result i32)
                            (then
                              (i32.const 4)
                              (br 5)
                            )
                          )
                        )
                      )
                    )
                  )
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