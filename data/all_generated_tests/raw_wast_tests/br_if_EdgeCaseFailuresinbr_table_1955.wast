;; Test 6: Perform a `br_table` instruction where the referenced index is reversed after stack-polymorphic operations, ensuring the stack is unwound correctly even when the index points to earlier stack states.

(assert_invalid
 (module
  (func $br_table-reversed-index (result i32)
   (block (result i32)
    (loop (result i32)
     (block 
      (block 
       (br_table 1 0 (i32.const 1)) 
       (i32.const 42)
      )
     )
    )
   )
  )
 )
 "label index out of range"
)