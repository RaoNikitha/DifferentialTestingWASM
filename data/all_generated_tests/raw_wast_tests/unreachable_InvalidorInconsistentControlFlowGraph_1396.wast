;; 7. **Unreachable Branch Target:**    - Context: Create a branch that directly leads to an `unreachable` instruction.    - Constraint: Test if CFG properly handles branch targets to ensure the trap is issued upon branching to `unreachable`.    - Expected Behavior: The test should result in a trap when the branch is taken, uniformly in both implementations.

(assert_invalid
  (module (func $type-branch-to-unreachable
    (block (br 0) (unreachable))
  ))
  "type mismatch"
)