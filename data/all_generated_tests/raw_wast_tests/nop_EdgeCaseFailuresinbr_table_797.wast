;; 8. Develop an instruction sequence where multiple `nop` instructions are followed by a `br_table` instruction that references targets with varying depths in nested `block` and `loop` structures. Test if the depth calculations and `nop` handling are correctly implemented.

(assert_invalid
  (module
    (func $complex-br-table
      (block $lbl1
        (loop $lbl2
          (nop)
          (nop)
          (nop)
          (br_table 0 1 2 (i32.const 1))))))
  "label index out of range"
)