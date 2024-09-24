;; 2. **Test 2: Unreachable as a Default Target in `br_table`**    - Inside a loop construct, use a `br_table` with the default target leading to an `unreachable` instruction.    - **Reasoning:** Verifies if default targets leading to `unreachable` correctly trap.    - **Constraint:** Ensures implementation consistency specifically when the default branch is hit.

(assert_invalid
  (module
    (func $br_table-unreachable-default-target (loop (br_table 0 (unreachable) (i32.const 1))))
  )
  "type mismatch"
)