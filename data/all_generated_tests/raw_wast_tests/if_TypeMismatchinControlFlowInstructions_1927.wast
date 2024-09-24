;; 8. **Type Overconsumption in Forward Branches**:    - Include a branch out of an `if` block that consumes more types than allowed by the blocktype.    - Tests that forward branches adhere to the operand stack constraints.    - **Constraint**: Forward branches must properly consume and match the stack height up to the entry point of the `if` block.

(assert_invalid
 (module 
   (func (result i32)
     (if (result i32) (i32.const 1)
       (then (br 0 (i32.const 1) (i32.const 2)))
       (else (i32.const 0))
     )
   )
 )
 "type mismatch"
)