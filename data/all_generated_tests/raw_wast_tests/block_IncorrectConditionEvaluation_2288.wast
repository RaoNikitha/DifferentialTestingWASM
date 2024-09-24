;; 9. **Non-zero Condition without Change**:    - Test with a non-zero constant passing through multiple non-altering operations before `br_if 0` (`i32.const 5`, latency instructions, `br_if 0`). Validate the conditional branching behavior remains correct.        Constraints: Ensures condition evaluations maintain correctness despite intervening operations.

(assert_invalid
  (module (func $non_zero_condition_without_change
    (block
      (i32.const 5)
      (nop)
      (nop)
      (br_if 0 (i32.const 5))
    )
  ))
  "type mismatch"
)