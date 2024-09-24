;; 7. **Test Description**: Utilize a `br_table` that indexes branches into multiple nested blocks, performing stack operations dependent on the selected branch. Confirm that the branch target resolution aligns with expected transitions at each index in the table.

(assert_invalid
  (module
    (func $br_table-nested-blocks
      (block $L1 (result i32)
        (block $L2 (result i32)
          (block $L3 (result i32)
            (block $L4 (result i32)
              (br_table 0 1 2 3 (i32.const 4) (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)