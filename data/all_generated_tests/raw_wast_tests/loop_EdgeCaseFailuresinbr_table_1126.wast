;; 7. **Test Description**:    - Construct a loop with a `br_table` where some indices target non-existent labels.    - Validate the default behaviour in presence of non-existent targets.    - This checks error handling for invalid label indices.    -

(assert_invalid
  (module
    (func (result i32)
      (block $label
        (loop $loop
          (i32.const 0)
          (br_table $label 1 (i32.const 0))
        )
      )
    )
  )
  "unknown label"
)