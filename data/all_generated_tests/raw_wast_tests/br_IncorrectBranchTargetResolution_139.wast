;; 10. **Sparse Label Targeting in Mixed Nested Controls:**    Write a function with interleaved `block`, `loop`, and `if` structures, using `br` instructions to target non-sequential outer labels. This ensures that even sparsely located labels are resolved correctly without misalignment.

(assert_invalid
  (module 
    (func $sparse-label-target
      (block
        (block
          (loop
            (block 
              (if (i32.const 1)
                (block
                  (br 2)
                )
              )
            )
          )
        )
      )
    )
  )
  "label out of range"
)