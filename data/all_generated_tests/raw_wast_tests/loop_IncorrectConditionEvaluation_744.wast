;; 5. **Test Description**: Create a loop that multiplies numbers by 2 until a `br_if` condition detects a result greater than 100, then breaks. Verify the loop stops at the correct point.    - **Constraint**: Validate correct detection and branching on the product exceeding 100.    - **Incorrect Condition Evaluation**: This checks for incorrect branching when condition evaluation misjudges the multiplication result.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (i32.const 2)
      (loop (result i32)
        (local.set 0)
        (local.get 0)
        (i32.const 2)
        (i32.mul)
        (local.set 0)
        (local.get 0)
        (i32.const 100)
        (i32.gt_s)
        (br_if 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)