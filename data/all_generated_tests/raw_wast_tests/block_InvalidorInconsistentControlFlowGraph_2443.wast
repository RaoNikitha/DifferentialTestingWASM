;; 4. **Test Overlapping Block Labels**:    - Description: Define blocks with overlapping labels that cause ambiguity in label resolution.    - Constraint: Check if the implementation correctly resolves and manages overlapping labeled blocks.    - CFG Relevance: Poor CFG generation can result in ambiguous paths or incorrect jumps.

(assert_invalid
  (module
    (func $overlap-labels
      (block $label1 (result i32)
        (block $label2 (br $label1 (i32.const 1)))
        (br $label1 (i32.const 2.0))
      )
    )
  )
  "type mismatch"
)