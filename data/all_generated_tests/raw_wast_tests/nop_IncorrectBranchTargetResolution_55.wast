;; Test 6: Insert a `nop` before and after a `br_if` instruction in a nested `if-else` block. Validate that the `br_if` selects the correct branch target, ignoring the `nop`.

(assert_invalid
  (module
    (func $test
      (block $blk1
        (block $blk2
          (if (i32.const 1)
            (then
              (nop)
              (br_if $blk1 (i32.const 0))
              (nop)
            )
            (else
              (nop)
              (br_if $blk2 (i32.const 1))
              (nop)
            )
          )
        )
      )
    )
  )
  "reaching unexpected end of function"
)