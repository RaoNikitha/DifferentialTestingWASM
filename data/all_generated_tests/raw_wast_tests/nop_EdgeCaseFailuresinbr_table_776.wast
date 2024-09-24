;; 7. Write a scenario where multiple `nop` instructions precede a `br_table` which incorrectly accesses an uninitialized memory table. Verify if the `nop` instruction is correctly inert and if the error handling is uniform.

(assert_invalid
  (module
    (memory 1)
    (table funcref (elem (i32.const 10) nop nop nop))
    (type (func))
    (func (block
            (br_table 0 (i32.const 0))
            nop nop nop
            (unreachable))))
  "invalid table index"
)