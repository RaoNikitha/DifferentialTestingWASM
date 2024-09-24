;; 6. **Test 6: Branch Target at End of Block with `nop`**:    - **Description**: Place a `nop` just before a label at the end of a block. Have a branch `br` targeting that label to ensure it still resolves correctly without skipping the `nop`.    - **Constraint**: The label resolution should handle `nop` transparently and reach the correct block end.    - **Relation to Incorrect Branch Target Resolution**: Validates correct branch target resolution at label boundaries with `nop`.

(assert_invalid
  (module
    (func $branch_target_with_nop
      (block $label
        (nop)
        (br $label)
      )
    )
  )
  "label not found"
)