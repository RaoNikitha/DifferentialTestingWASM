;; 9. **Cross-Reference Label Mismatch**:    - Introduce a block with multiple label references, incorrectly addressing blocks at improper nesting levels.    - Focus on examining incorrect label indexing and handling of nested blocks, which affects CFG consistency.

(assert_invalid
  (module
    (func $cross-reference-label-mismatch
      (block (result i32)
        (block (result f32)
          (br 2)
        )
        (i32.const 0)
      )
    )
  )
  "unknown label"
)