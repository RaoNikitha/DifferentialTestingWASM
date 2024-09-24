;; 10. **Complex Operand Stack Entry and Exit:**     - Test a nested structure where the operand stack's entry and exit points are complex due to multiple levels of nested `block` and `loop` constructs.     - Focuses on verifying that the `br` instruction appropriately manages operand stack unwinding across intricate nesting hierarchies and maintains stack consistency throughout execution.

(assert_invalid
 (module
   (func $complex-stack
     (block $outer (result i32)
       (i32.const 1)
       (block $mid (result i32)
         (i32.const 2)
         (block $inner (result i32)
           (i32.const 3)
           (block $inner-most (result i32)
             (i32.const 4)
             (br $inner)
           )
         )
       )
     )
   )
 )
 "type mismatch"
)