;; 3. Integrate `nop` within a function containing multiple nested `block` and `end` instructions. Determine if control flow correctly enters and exits these `block` sections, ensuring no blocks are skipped or improperly iterated.

(assert_invalid
  (module
    (func
      (block
        (block
          (nop)
        )
        (nop)
      )
      (nop)
    )
  )
  "expected valid instruction"
)