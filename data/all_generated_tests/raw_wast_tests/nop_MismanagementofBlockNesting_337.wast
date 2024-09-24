;; 8. **Matching Labels for Nested Blocks with `nop`**:     - Assign unique labels to nested blocks and place `nop` within these blocks. Use branching instructions to jump to labelled blocks, confirming the branch targets are accurately resolved.    - This tests label correctness in nested blocks when `nop` is present, ensuring no confusion or misinterpretation of control flow targets.

(assert_invalid
  (module
    (func $nested-labels
      (block $label1
        (block $label2
          (nop)
          (br $label1)
        )
      )
    )
  )
  "type mismatch"
)