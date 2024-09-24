;; 9. **Test Description:**    - **Edge Case:** Sequential `br_table` chaining to `unreachable`.    - **Constraint Checked:** Behavior when shifting from one `br_table` directly into another ending in `unreachable`.    - **Details:** Chain two `br_table` instructions sequentially where the second leads to `unreachable`, verifying cascading trapping behavior.

(assert_invalid
  (module
    (func $br_table-chain-unreachable
      (block
        (br_table 0 0 (i32.const 0))
        (br_table 0 0 (unreachable))
      )
    )
  )
  "type mismatch"
)