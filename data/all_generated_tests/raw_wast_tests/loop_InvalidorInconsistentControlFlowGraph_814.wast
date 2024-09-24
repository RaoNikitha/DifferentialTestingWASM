;; 5. **Indirect Branch with Out of Bounds Default Target**:    Create a `br_table` instruction inside a loop with indices targeting valid labels but includes a default target that is out of bounds.    Constraint: Validate handling of out-of-bounds default targets in indirect branches.    Expected: Detection of out-of-bounds error should correctly prevent invalid loop execution.

(assert_invalid
  (module 
    (func $indirect-branch-oob-default
      (block 
        (loop (result i32)
          (i32.const 0)
          (br_table 0 0 1 (i32.const 999))
        )
      )
    )
  )
  "out-of-bounds default target for br_table"
)