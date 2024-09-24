;; 2. Insert a `nop` instruction in between a sequence of `br_table` instructions where the table indices include a value that is at the upper boundary of the allowed range, ensuring that the presence of `nop` does not interfere with the normal branching logic.

(assert_invalid
  (module
    (func $br_table_with_nop
      (block $label
        (i32.const 0)
        (br_table $label $label $label)
        (nop)
        (i32.const 1)
        (br_table $label $label $label)
      )
    )
  )
  "type mismatch"
)