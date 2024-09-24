;; 5. **Test 5: Missing Label in `br_table`**    - **Description**: Build a loop containing a `br_table` instruction but omit defining one of its referenced labels. The loop includes a condition to always branch through the missing label index.    - **Constraint**: This verifies the existence and validation of all referenced labels.    - **Infinite Loop Relation**: The absence of a referenced label can cause the loop control flow to dysfunction, resulting in an infinite loop.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block
        (loop
          (br_table 0 2 (i32.const 1) (local.get 0))
        )
      )
    )
  )
  "unknown label"
)