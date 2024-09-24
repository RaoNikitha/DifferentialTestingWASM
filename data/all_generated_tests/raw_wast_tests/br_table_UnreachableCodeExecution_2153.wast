;; 3. **Test Description**: A `br_table` with multiple label vectors where one vector is intentionally set with a mismatched operand stack type, leading to an `unreachable` instruction when this branch is reached. This tests the implementation’s ability to handle operand type mismatches gracefully.

(assert_invalid
 (module
   (func (param i32)
     (block $outer
       (block $inner
         (i32.const 0)
         (br_table 0 $inner $outer (i32.const 1)))   
       (unreachable)
     )
   )
 )
 "type mismatch"
)