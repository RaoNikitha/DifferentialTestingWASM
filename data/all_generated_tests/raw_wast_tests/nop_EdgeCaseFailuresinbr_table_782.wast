;; 3. **Test Description**: Include a `br_table` instruction with several valid targets and an index of `0`. Place a `nop` instruction between each valid target label.     - **Constraint Checked**: Check for correct target selection where `nop` is interspersed and does not affect selection logic.     - **Edge Case Relation**: Ensure that innocent `nop` instructions do not distort branch targets' handling.

(assert_invalid
  (module 
    (func $br_table-test
      (block $label1
        (nop)
        (block $label2
          (nop)
          (block $label3
            (nop)
            (br_table $label1 $label2 $label3 (i32.const 0))
            (nop)
          )
        )
      )
    )
  )
  "type mismatch"
)