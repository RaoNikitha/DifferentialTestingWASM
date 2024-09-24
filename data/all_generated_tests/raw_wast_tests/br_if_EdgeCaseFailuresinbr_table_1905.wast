;; 6. **Test with Sparse Label Entries**:    Use a `br_table` instruction in a scenario where the `ctl_stack` has sporadic or sparse label entries, ensuring that irregular label spacing does not lead to incorrect label lookups.

(assert_invalid
  (module
    (func $sparse-label-entries
      (block $outer
        (loop $inner
          (br_table 1 0 (i32.const 0))  ;; br_if with sparse label entries
        )
        (nop)
      )
    )
  )
  "type mismatch"
)