;; 6. **Test 6: Incorrect Label Index With Nested Blocks**    - **Description**: Create a complex loop with nested blocks and a `br_table` pointing to incorrect label indices among the blocks, alongside a restart condition.    - **Constraint**: Tests accurate relative indexing within nested blocks.    - **Infinite Loop Relation**: Incorrect label index resolution can lead to endless misdirection within the loops.

(assert_invalid
 (module
  (func
   (block $label0
    (block $label1
     (loop $label2
      (br_table $label3 $label1 $label0 (i32.const 2))
     )
    )
   )
  )
 )
 "unknown label $label3"
)