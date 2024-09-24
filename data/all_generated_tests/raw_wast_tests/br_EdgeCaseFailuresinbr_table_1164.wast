;; 5. **Test for Mixed Type Result Stack Restoration:**    - Use a `br_table` with targets leading to blocks that consume and produce different result types, ensuring stack management upon index selection.      - **Constraint Checked:** Verifies correct stack unwinding and restoration considering different result types for various branches.      - **Edge Case Insight:** Checks stack consistency and type matching during branch targeting.

(assert_invalid
  (module
    (func
      (block (result f64)
        (br_table 0 1 (i32.const 0))
      )
      (block (result i32)
        (br 0)
      )
    )
  )
  "type mismatch"
)