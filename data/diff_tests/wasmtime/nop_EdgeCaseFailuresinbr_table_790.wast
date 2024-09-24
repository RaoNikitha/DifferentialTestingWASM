;; 1. Create a test where a `br_table` instruction is preceded by multiple `nop` instructions and the index provided to `br_table` is equal to the number of targets. This tests if the `nop` instructions are correctly ignored before reaching the `br_table` and properly handling an index equal to the number of available targets.

(assert_malformed
  (module 
    (func 
      (block 
        (br_table 0 1 2 3)
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        br_table 0 1 2
      )
    )
  )
  "br_table index out of range"
)