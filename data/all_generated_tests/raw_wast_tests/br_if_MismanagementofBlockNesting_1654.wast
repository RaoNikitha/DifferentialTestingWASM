;; 5. **Test Description**: Create a scenario with nested `if` constructs where the true path contains a `br_if` targeting the outermost `if`. Confirm the instruction correctly exits all nested `if` constructs.    - **Constraint Checked**: Proper exit from nested `if` constructs to the targeted outer `if`.    - **Relation to Mismanagement of Block Nesting**: Improper label indexing can lead to incorrect control flow, exiting only an inner `if`.

(assert_invalid
  (module 
    (func $nested_if 
      (block 
        (if (i32.const 1) 
          (then 
            (if (i32.const 1) 
              (then (br_if 1 (i32.const 1))))
          )
        )
      )
    )
  )
  "unknown label"
)