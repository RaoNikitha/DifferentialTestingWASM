;; 10. **Inverted Condition Error Handling**:     - Implement an `if` block where a `br_if` condition is deliberately inverted (true branch on false condition). Verify if this leads to incorrect branching in one implementation, indicating a faulty conditional branch evaluation mechanism.

(assert_invalid
  (module
    (func $inverted-condition-error
      (block
        (if (i32.const 0) (then (br_if 0 (i32.const 1))))
      )
    )
  )
  "condition always false"
)