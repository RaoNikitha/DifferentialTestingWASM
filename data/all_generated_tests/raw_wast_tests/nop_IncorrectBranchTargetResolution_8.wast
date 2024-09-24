;; 9. **Test Description: Block Inline Nesting with `br` and `nop`**    - **Scenario**: Inline nest smaller blocks within a larger block containing `nop` and use `br` to target specific labels.    - **Constraint**: Checks if inline nested blocks with `nop` affect branch target resolution.    - **Context**: Incorrect branch target resolution due to nested `nop` can misroute control flow within the inline blocks.

(assert_invalid
  (module
    (func
      (block
        (block (nop))
        (block (br 1))
      )
    )
  )
  "invalid branch depth"
)