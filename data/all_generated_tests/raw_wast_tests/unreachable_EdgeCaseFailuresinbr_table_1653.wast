;; 4. **Test 4: Nested Blocks with `br_table` and Unreachable**    - Nested blocks where an inner block has a `br_table` leading to an `unreachable` code path in an outer block.    - **Reasoning:** Verifies correct trapping behavior within nested control structures.    - **Constraint:** Tests if both implementations trap consistently in complex nested blocks.

(assert_invalid
  (module (func $nested-blocks-br_table-unreachable
    (block
      (block
        (br_table 0 1 (unreachable))
      )
      (unreachable)
      (i32.const 1)
    )
  ))
  "type mismatch"
)