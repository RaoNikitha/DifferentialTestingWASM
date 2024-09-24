;; 4. **Sequential Default Cases**:    - Define a block with a sequence of `br_table` instructions, each having increasing numbers of indices targeting their respective default labels. Verify if each `br_table` handles its respective index-target appropriately.    - **Constraint Checked**: Handling sequences of `br_table` with their respective default targets.

(assert_invalid
  (module
    (func $sequential-br_table-defaults
      (block $outer
        (block $0
          (block $1
            (br_table 0 1 2 (i32.const 0))
          )
          (br_table 0 1 (i32.const 0))
        )
        (br_table 0 (i32.const 0))
      )
    )
  )
  "type mismatch from invalid br_table targets"
)