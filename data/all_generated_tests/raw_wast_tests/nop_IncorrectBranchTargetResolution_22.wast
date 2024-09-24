;; 3. **Test 3: Conditional Branch with `nop`**:    - **Description**: Insert `nop` before a conditional branch (`br_if`). Verify that the branch resolves correctly based on the condition, without being affected by the `nop` instruction.    - **Constraint**: Validate that the condition and branch target are correctly evaluated despite the `nop`.    - **Relation to Incorrect Branch Target Resolution**: Checks if `nop` incorrectly influences the condition evaluation or the target resolution in a conditional branch.

(assert_invalid
  (module 
    (func $conditional-branch 
      (block $label
        nop
        (br_if $label (i32.const 1))
      )
    )
  )
  "type mismatch"
)