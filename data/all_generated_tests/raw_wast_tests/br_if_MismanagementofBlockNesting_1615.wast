;; 6. **Test br_if in Deeply Nested Conditional Branches**:     Create a deeply nested structure with branches controlled by several `br_if` instructions, then verify the condition and correct stack management after unwinding multiple levels. This ensures proper management of nested block depths.

(assert_invalid
 (module 
   (func (result i32)
     (block (result i32)
       (block (result i32) 
         (block (result i32)
           (block (result i32)
             (br_if 3 (i32.const 1))
           )
         )
       )
     )
   )
 )
 "type mismatch"
)