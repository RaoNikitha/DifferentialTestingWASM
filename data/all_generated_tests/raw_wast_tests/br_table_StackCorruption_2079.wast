;; 9. **Test: Forward and Backward Branches with Mismatched Stack**    - **Description:** Try using `br_table` with labels targeting both forward and backward branches with incompatible stack types.    - **Constraint:** Handles the difference between forward-producing and backward-consuming operand types.    - **Relation to Stack Corruption:** Validates stack handling for mixed forward and backward jump scenarios.

(assert_invalid
  (module
    (func
      (block (result i32)
        (loop (result i64)
          (br_table 0 1 (local.get 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)