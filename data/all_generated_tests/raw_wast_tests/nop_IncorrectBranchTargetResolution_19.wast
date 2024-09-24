;; 10. **Indirect Branching with `br_table` and `nop`**: Construct a function with a `br_table` for indirect branching, interleave `nop` instructions, and specify several target blocks. Validate if `nop` results in an incorrect branch target being chosen.

(assert_invalid
  (module
    (func $indirect-br (param i32) 
      (block $label0
        (block $label1
          (block $label2
            (block $label3
              (br_table $label0 $label1 $label2 $label3 
                (local.get 0)
                (nop)
                (nop)))))
      )
    )
  )
  "type mismatch"
)