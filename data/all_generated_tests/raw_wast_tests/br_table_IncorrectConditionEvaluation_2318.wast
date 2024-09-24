;; 8. Test the `br_table` instruction combined with another control flow instruction like `br_if`, ensuring condition evaluations direct to the correct label instead of misinterpreted default branches.

(assert_invalid
  (module
    (func
      (block $label1
        (block $label2
          (i32.const 1) 
          (br_if $label2 (i32.const 0)) 
          (br_table $label1 $label2 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)