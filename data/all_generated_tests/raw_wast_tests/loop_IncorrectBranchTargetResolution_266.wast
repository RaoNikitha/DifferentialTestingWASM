;; 7. **Shadowed Loop Labels**:    Create nested loops where inner loops shadow outer loop labels. Test branching within the inner loop context to ensure it does not incorrectly resolve to an outer loop label.

(assert_invalid
  (module (func $shadowed-loop-labels
    (block
      (loop $outer (loop $inner (br $outer)))
    )
  ))
  "type mismatch"
)