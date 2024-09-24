;; 1. **Index Out of Bounds Handling:**    - Description: Create a `br_table` with 2 valid labels and an index that exceeds this range.    - Check if the program gracefully handles indices that exceed the number of targets, potentially falling back to the default case.    - Specific Constraint: Ensure the implementation correctly identifies and handles out-of-bounds indices.

(assert_invalid
  (module
    (func $index-out-of-bounds-handling
      (block $label0
        (block $label1
          (br_table 0 1 2 (i32.const 3))
        )
      )
    )
  )
  "index out of bounds"
)