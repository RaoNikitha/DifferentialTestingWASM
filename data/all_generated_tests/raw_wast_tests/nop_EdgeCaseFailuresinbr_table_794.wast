;; 5. Design a test where multiple `nop` instructions are inserted in between targets of a `br_table` instruction. Verify whether the `nop` instructions are duly ignored and the correct branch target is selected based on the provided index.

 ;; (module
  (func $test (param $index i32)
    (block $label0
      (block $label1
        (block $label2
          (block $label3
            (br_table $label0 $label1 $label2 $label3 (local.get $index))
            nop
            nop
            nop
            nop
            nop
          )
        )
      )
    )
  )
)