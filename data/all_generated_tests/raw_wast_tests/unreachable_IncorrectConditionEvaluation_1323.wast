;; 4. **Test Description:**    - Use `unreachable` within an `if` branch where the condition is a complex expression (e.g., `(i32.eq (i32.const 1) (i32.const 1))`). Ensure the true branch traps correctly and false branch continues execution normally.    - Constraint: Verifies complex condition evaluation and branching.    - Relation to Incorrect Condition Evaluation: Ensures complex condition handling does not mislead the opcode tracking.

(assert_invalid
  (module (func $type-if-complex-condition
    (if (i32.eq (i32.const 1) (i32.const 1))
      (then (unreachable))
      (else (drop (i32.const 0)))
    )
  ))
  "type mismatch"
)