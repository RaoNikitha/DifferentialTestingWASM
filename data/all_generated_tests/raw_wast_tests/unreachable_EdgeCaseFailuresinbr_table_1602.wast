;; 3. **Test Description:**    - Test a `br_table` with a valid set of branch targets followed by an `unreachable` instruction, and include a sequence that depends on selecting a branch target that leads to a valid instruction sequence.    - **Constraint:** Probes if `unreachable` prevents execution path changes caused by `br_table`.    - **Relation to Edge Case:** Differentially tests if both implementations handle reachable instructions post-`br_table` inconsistently.

(assert_invalid
  (module
    (func $test_br_table_unreachable
      (block $L0
        (block $L1
          (block $L2
            (br_table $L1 $L2 $L0 (i32.const 0))
            (unreachable)
            (i32.const 42)
          )
        )
      )
    )
  )
  "type mismatch"
)