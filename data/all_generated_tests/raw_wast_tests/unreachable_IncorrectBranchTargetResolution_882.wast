;; 3. **Test Unreachable in If-Else with Branch Out:**    - Use `unreachable` within an `if` block, and use the `br` instruction to jump out to a label outside of `if-else`.    - *Constraint*: Ensures the branch correctly exits the conditional block and resumes outside execution.    - *Relation to Branch Resolution*: Verifies accurate resolution in context-dependent (if-else) blocks.

(assert_invalid
  (module (func $test_if_else_branch
    (block $label (if (i32.const 0) (then (unreachable)) (else (br $label))))
  ))
  "type mismatch"
)