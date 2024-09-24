;; 8. **Test with Label and Target Mismatches**:    Design a test where `br_table` instruction targets labels that have been modified or mismatched in the context, making sure both implementations detect and handle these discrepancies properly.

(assert_invalid
  (module (func $label-target-mismatch
    (block $outer 
      (block $inner 
        (br_if $outer (i32.const 1))
      )
      (br_if $inner (i32.const 2))
    )
  ))
  "unknown label"
)