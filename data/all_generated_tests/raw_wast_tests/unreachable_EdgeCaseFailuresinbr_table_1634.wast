;; 5. **Test Description:**    - **Edge Case:** Deeply nested `br_table` with multiple `unreachable` instructions.    - **Constraint Checked:** Correct processing depth within nested control and trap situations.    - **Details:** Construct a series of nested blocks, loops or conditional constructs with `br_table` instructions leading to deeply nested `unreachable` instructions to confirm consistent trapping behavior.

(assert_invalid
  (module (func $deeply_nested_br_unreachable
    (block
      (loop
        (block
          (br_table 0 1 (block (br_table 2 (loop (unreachable)))))
        )
      )
    )
  ))
  "type mismatch"
)