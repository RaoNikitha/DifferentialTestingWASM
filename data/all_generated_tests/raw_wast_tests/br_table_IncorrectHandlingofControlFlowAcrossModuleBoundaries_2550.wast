;; 9. **Inter-module Branching with Type Inconsistencies**:    - Test Description: A module with a `br_table` instruction branching to external functions where type inconsistencies are deliberately programmed to see if type mismatches lead to correct traps or errors during control transfers.    - Constraint: Checks for strict type enforcement and proper dynamic control handling during branching to externally imported calls.    - Differential Reasoning: `wizard_engine` might not effectively handle or trap type mismatches during inter-module dynamic control transfers.

(assert_invalid
  (module
    (import "env" "external_func" (func $ext (result i64)))
    (func $test
      (block (br_table 0 (call $ext)))
    )
  )
  "type mismatch"
)