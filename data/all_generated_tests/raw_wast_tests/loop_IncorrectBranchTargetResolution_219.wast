;; 10. **Test Input: Indirect Branch Misresolution**    - Description: Utilize `br_table` within nested loops where branch indices inadvertently target labels outside the intended scope.    - Constraint: Test correct resolution of indirect branches in significantly complex control flows.    - Focus: Determine if `br_table` manages label indices correctly within nested loop environments.  These tests focus on resolving label-related branching instructions within and across nested `loop` and `block` structures, ensuring both correct execution flow and appropriate error handling.

(assert_invalid
  (module (func $indirect-branch-misresolution
    (block
      (loop
        (block (br_table 2 0 1 (i32.const 0))) 
        (loop (br 2))
      )
    )))
  "type mismatch"
)