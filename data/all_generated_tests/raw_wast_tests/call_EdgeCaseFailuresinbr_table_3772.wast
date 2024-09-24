;; 1. **Test Description**: Create a module with a `br_table` instruction that includes an index pointing to a non-existent target (e.g., having only 3 targets but using an index of 4). Validate the behavior when the call index is out of bounds and ensure it triggers proper error handling.    - **Specific Constraint**: Check if the `br_table` properly handles invalid target indices.    - **Relation to `call`**: Differences in error handling for invalid indices in `br_table` may reveal discrepancies in handling invalid function indices in `call`.

(assert_invalid
  (module
    (func $test (result i32)
      (block $label0
        (block $label1
          (block $label2
            (block $label3
              (br_table $label0 $label1 $label2 $label4 (i32.const 4))
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "br_table with out-of-bounds target"
)