;; 5. **Test 5: Invalid Immediate in `br_table` Leading to Unreachable**    - A `br_table` instruction with invalid immediate values, having a target which contains `unreachable`.    - **Reasoning:** Examines error handling for malformed `br_table` with `unreachable` as a possible target.    - **Constraint:** Validates robustness and consistency in error handling for invalid immediates.

(assert_invalid
  (module
    (func
      (block (br_table 0 1 0 (unreachable))))
  )
  "invalid immediate values"
)