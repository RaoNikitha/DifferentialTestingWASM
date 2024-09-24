;; 3. **Intermediate Block Branch Target**: Use an intermediate block with a nested sequence and branch (`br 2`) that target blocks two levels up. This tests label indexing across multiple levels of nested blocks.

(assert_invalid
 (module
  (func (result i32)
   (block 
    (block 
     (block
      (br 2) 
      (i32.const 0)
     )
     (i32.const 1)
    )
    (i32.const 2)
   )
  )
 )
 "type mismatch"
)