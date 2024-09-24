;; 7. **Backwards Branch Mismatch**:    - Description: Implement a loop with a backward `br_table` branch where one of the backward branch targets is `unreachable`.    - Constraint: Evaluates consistency in operand type consumption when dealing with backward branching.    - Relation: Wrong handling could redirect erroneously to `unreachable` upon resuming improper execution flow.

(assert_invalid
 (module
   (func
     (loop (result i32)
       (block (result i32)
         (br_table 0 1 (i32.const 1) (unreachable))
       )
     )
   )
 )
 "type mismatch"
)