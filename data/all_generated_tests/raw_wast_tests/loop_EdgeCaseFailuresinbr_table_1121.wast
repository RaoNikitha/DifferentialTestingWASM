;; 2. **Test Description**:    - Create a loop with a large `br_table` entry list, ensuring some branch indices are out of the range of provided labels.    - Verify if the index out of bounds correctly handles the default target.    - This tests for robustness in handling indices that exceed the table bounds.    -

(assert_invalid
  (module
    (func $loop-br_table-out-of-bounds
      (block $outer (loop $inner
        (br_table $outer $inner $inner 2 1 (br_table 0 (br 0))))
    ))
  )
  "index out of bounds"
)