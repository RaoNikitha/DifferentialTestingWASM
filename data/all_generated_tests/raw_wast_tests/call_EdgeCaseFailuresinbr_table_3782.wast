;; 1. Create a WebAssembly module with a `br_table` instruction where the index provided to `br_table` exceeds the number of available target labels. In WebAssembly, expect an out-of-bounds trap, while in wizard_engine, verify if the separation of signature handling causes different error handling behavior.

(assert_invalid
  (module
    (func $test-br-table
      (block $blk0
        (block $blk1
          (br_table $blk0 $blk1 (i32.const 2))
        )
      )
    )
  )
  "unknown label"
)