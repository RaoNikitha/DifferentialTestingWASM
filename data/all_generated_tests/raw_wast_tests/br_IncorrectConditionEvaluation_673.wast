;; 4. **Test 4: Incorrect Condition Evaluation on Complex Logical Expressions**    - Use a combination of logical AND (`i32.and`) and OR (`i32.or`) expressions in the condition of a `br_if` instruction. Verify correct branching behavior.    - **Constraint Checked**: Correct evaluation of logical expressions in conditions.

(assert_invalid
  (module
    (func $test-complex-logical-cond
      (block (br_if 0 (i32.or (i32.const 1) (i32.and (i32.const 0) (i32.const 1)))))
    )
  )
  "type mismatch"
)