;; 9. **Test 9:** Formulate a `br_table` where all indices trigger `unreachable`, ensuring that any index prompts a trap, thus testing if both `br_table` handling and `unreachable` prompt deterministic traps across implementations.

(assert_malformed
  (module (func (result i32)
    (block (result i32)
      (br_table 0 (unreachable))
    )
  ))
  "malformed br_table"
)