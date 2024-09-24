;; 3. **Test for Index Zero with Empty Target Table:**    - Use a `br_table` instruction where the target table is empty, and the index is zero.      - **Constraint Checked:** Verifies handling when no valid target exists, even for index zero.      - **Edge Case Insight:** Checks the engine's behavior when no branching targets are available, addressing boundary cases.

(assert_invalid
  (module
    (func $index-zero-empty-target-table
      (block
        (br_table (i32.const 0))
      )
    )
  )
  "unknown label"
)