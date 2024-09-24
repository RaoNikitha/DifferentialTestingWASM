;; 7. **Nested Loops with Different Depths Test**:    - Implement nested loops of varying depths and use `br` with label indices that specifically target different loop levels. Check for correct loop initiation as per the indexed label, ensuring it starts at the intended loop and not a different depth.

(assert_invalid
  (module
    (func (result i32)
      (block (loop (loop (i32.const 1) (br 1) (i32.const 2))))
      (i32.const 0)
    )
  )
  "type mismatch"
)