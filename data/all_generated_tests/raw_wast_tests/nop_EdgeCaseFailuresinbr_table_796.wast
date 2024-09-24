;; 7. Formulate a sequence where a `br_table` instruction is within an `if` block, preceded by `nop` instructions, with an index referring to a label outside the block. Validate whether the `nop` instructions affect the index handling and control flow resolution.

(assert_invalid
  (module 
    (func (block $label1 
      (if (i32.const 1) 
        (then 
          (nop) 
          (nop) 
          (br_table $label1 (i32.const 0)))))) 
  "invalid label"
)