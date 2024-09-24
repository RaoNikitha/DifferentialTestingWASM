;; Test 3: Include multiple `nop` instructions between a `block` start and a `br_table` instruction. Verify that the correct branch target is resolved and executed as intended without interference from the `nop` instructions.

(assert_invalid
  (module
    (func
      (block $label (nop) (nop) (nop) (br_table $label) (nop))
    )
  )
  "incorrect label"
)