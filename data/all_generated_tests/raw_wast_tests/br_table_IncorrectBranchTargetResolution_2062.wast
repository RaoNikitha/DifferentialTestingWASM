;; 2. **Test Description:** Place the `br_table` instruction inside nested blocks with complex branching, and verify that the resolution of label indices correctly references the current block depth.    - **Constraint Checked:** Confirms relative indexing of labels in nested blocks is handled correctly.    - **Relation to Incorrect Branch Target Resolution:** Misinterpreted label indices could result in branching out of the wrong block.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block
            (loop (result i32)
              (block (result i32)
                (br_table 0 1 (i32.const 2) (i32.const 0))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)