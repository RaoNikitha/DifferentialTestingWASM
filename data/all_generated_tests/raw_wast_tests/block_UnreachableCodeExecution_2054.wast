;; 5. **Test 5: Table Branching over Unreachable**    - **Description**: Utilize a `br_table` instruction in a block that conditionally branches to multiple labels, some pointing to `unreachable` instructions, ensuring branches never erroneously hit `unreachable`.    - **Constraint**: Verifies table-based branching correctly avoids unreachable targets.

(assert_invalid
  (module
    (func $table-branch-over-unreachable
      (block (result i32)
        (i32.const 1)
        (block (br_table 0 1))
        (unreachable)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)