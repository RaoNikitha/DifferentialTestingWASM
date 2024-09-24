;; 2. **Test Description:**    - Implement a `br_if` inside an `if-else` block with the condition dynamically set based on a function's return value (ensuring it is true). This should trigger the branch only if the result meets a specific condition.    - **Constraint Checked:** Condition being accurately evaluated and triggering the branch appropriately.    - **Test Relation:** Ensures the correct condition evaluation and thus the correct execution path based on dynamic function results.

(assert_invalid
  (module
    (func $br_if_conditional (param $cond i32) (result i32)
      (if (result i32)
        (local.get $cond)
        (then
          (br_if 0 (i32.const 1))
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)