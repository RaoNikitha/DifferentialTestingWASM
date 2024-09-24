;; 6. **Test: Using All Available Indexes**    - **Description:** Ensure every index in the label vector is tested by looping through each possible operand value.    - **Constraint:** Each label should point to a uniquely valid target.    - **Relation to Stack Corruption:** Validates the correct branch and stack unwinding for each potential operand index.

(assert_invalid
  (module
    (func $test_all_indexes
      (block $0
        (block $1
          (block $2
            (block $3
              ;; Initialize the br_table instruction with operand values from 0 to 3
              (br_table $0 $1 $2 $3 4 (i32.const 0)) ;; Expected to branch to $0
              (nop)
              (i32.const 1)
              (br_table $0 $1 $2 $3 4 (i32.const 1)) ;; Expected to branch to $1
              (nop)
              (i32.const 2)
              (br_table $0 $1 $2 $3 4 (i32.const 2)) ;; Expected to branch to $2
              (nop)
              (i32.const 3)
              (br_table $0 $1 $2 $3 4 (i32.const 3)) ;; Expected to branch to $3
              (nop)
              (i32.const 4)
              (br_table $0 $1 $2 $3 4 (i32.const 4)) ;; Out of bounds, should use default (4)
              (nop)
            )
          )
        )
      )
    )
  )
  "default label invalid"
)