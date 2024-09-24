;; - Test Case 10: Design a loop with a logical error in the branching condition so it always branches to an incorrect label, potentially leading to an `unreachable`. This verifies logical consistency in branch condition checks.

(assert_invalid
  (module (func $logic-error-branch-condition
    (loop (result i32)
      (i32.const 0)
      (br_if 1 (i32.const 1))
      (unreachable)
    )
  ))
  "index out of bounds"
)