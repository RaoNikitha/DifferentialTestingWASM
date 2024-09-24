;; 3. **Backward Branch to a Non-Existing Loop:**    - Test a `br` instruction intended to jump back to a non-existing loop.    - This ensures that the CFG correctly validates backward branches and identifies improper loop targets.

(assert_invalid
  (module (func $backward-branch-non-existing-loop (br 0)))
  "unknown label"
)