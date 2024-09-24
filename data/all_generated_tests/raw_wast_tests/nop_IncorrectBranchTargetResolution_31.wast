;; - Test Description 2: Design a code sample where a `nop` instruction is followed by an `if` statement with branches targeting different labels. Check if the `nop` affects the branch labels, leading the `br` instruction within the `if` body to jump to a wrong block.

(assert_invalid
  (module
    (func $test (block $blk1
                  (block $blk2
                    (nop)
                    (if (i32.const 1)
                      (then (br $blk2))
                      (else (br $blk1))
                    )
                  )
                )
    )
  )
  "type mismatch"
)