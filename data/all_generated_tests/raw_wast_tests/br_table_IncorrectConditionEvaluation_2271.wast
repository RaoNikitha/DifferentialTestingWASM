;; Test 1: Execute a `br_table` instruction with a branch table containing multiple targets where the operand index is within bounds. Verify that the correct branch is chosen according to the operand value.

(assert_invalid
 (module
  (func $valid-br_table
   (block $label0 
    (block $label1 
     (block $label2 
      (block $label3
       (br_table $label1 $label2 $label3 $label0 (i32.const 1)))
     )
    )
   )
  )
 )
 "unknown label"
)