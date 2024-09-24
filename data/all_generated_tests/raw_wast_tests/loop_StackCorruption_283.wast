;; 4. Create a test where a `br_table` instruction inside a `loop` indirectly targets various labels. Ensure that indirect branches do not lead to stack corruption and that default targets handle out-of-bounds conditions properly.

(assert_invalid
 (module 
  (func (result i32)
   (loop (result i32) 
    (block (result i32)
     (br_table 0 1 (local.get 0))
     (i32.const 0)
    )
   )
  )
 )
 "type mismatch"
)