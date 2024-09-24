;; 6. **Test Description:** Test sequential `br_if` instructions with alternating true and false conditions to verify accurate individual condition evaluations.    - **Specific Constraint:** Validate execution path for sequential `br_if` instructions.    - **Relation to Incorrect Condition Evaluation:** Ensures no carry-over effect between sequential conditional evaluations.

(assert_invalid
  (module (func $sequential-br_if-conditions
    (block (result i32)
      (block (br_if 0 (i32.const 1))) 
      (block (br_if 0 (i32.const 0))) 
      (block (br_if 0 (i32.const 1)))
      (i32.const 2)
    )
  ))
  "unexpected result type"
)