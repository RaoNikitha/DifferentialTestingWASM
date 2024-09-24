;; 9. **Test: Conditional Branching in Different Execution Paths**    - **Description:** Implement `br_if` instructions within different execution paths of an `if-else` construct. Conditions should vary such that only specific execution paths lead to branches.    - **Constraint:** Verify that conditions in both `if` and `else` parts are evaluated correctly, and `br_if` instructions follow the appropriate control flow.

(assert_invalid
 (module
   (func (param i32 i32) (result i32)
     (if (result i32)
       (i32.eq (local.get 0) (i32.const 0))
       (then
         (br_if 0 (i32.const 1))
         (i32.const 2)
       )
       (else
         (br_if 0 (i32.const 1))
         (i32.const 3)
       )
     )
   )
 )
 "unknown label"
)