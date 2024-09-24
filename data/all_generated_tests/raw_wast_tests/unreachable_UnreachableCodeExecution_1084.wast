;; 5. **Test `unreachable` within switch case default branch:**    - Create a `br_table` with multiple labels which default to an `unreachable` instruction, ensuring it triggers on unsupported cases.    - **Constraint:** Verifies robustness in `br_table` evaluations.    - **Related to**: Ensures default case handling does not erroneously trap.

(assert_invalid
  (module (func (block (br_table 0 1 (unreachable)))))
  "type mismatch"
)