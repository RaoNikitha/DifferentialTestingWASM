;; 6. **Invalid Branch Target:**    - Test a `br` instruction that targets a label not defined in the current context.    - Validates the CFG's ability to correctly identify and prohibit branches to undefined labels, ensuring label validity constraints are upheld.

(assert_invalid
  (module (func $invalid-target
    (block (br 1))
  ))
  "unknown label"
)