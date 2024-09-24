;; 5. **Test Description**: Two nested loops where the inner loop contains a `br` targeting the outer loop; the outer loop has a `br_if` targeting the end of a containing `block`.    - **Constraint Checked**: Ensures that branching instructions correctly target nested structure points.    - **Relation to Mismanagement of Block Nesting**: Mismanagement may cause branches to erroneously target unintended structure points instead of intended exits.

(assert_invalid
  (module
    (func $nested-loops 
      (block (result i32)
        (loop (result i32)
          (loop (result i32)
            (br 1)
          )
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)