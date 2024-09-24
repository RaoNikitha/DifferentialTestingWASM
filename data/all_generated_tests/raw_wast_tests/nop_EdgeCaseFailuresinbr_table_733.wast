;; 4. In a nested control structure, place a `br_table` instruction with a valid index, but surround it with multiple `nop` instructions. This will test how a properly indexed `br_table` interacts with multiple `nop` instructions in nested contexts.

(assert_invalid
  (module
    (func $nested-nop-br-table
      (block
        (nop)
        (block
          (nop)
          (nop)
          (br_table 0 (i32.const 0))
          (nop)
          (nop)
        )
        (nop)
      )
    )
  )
  "type mismatch"
)