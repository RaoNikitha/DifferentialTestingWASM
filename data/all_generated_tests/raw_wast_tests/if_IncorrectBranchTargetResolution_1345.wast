;; 6. **Label Resolution in Deeply Nested Structures**:    - Create complex nested structures with blocks (`loop`, `if`, etc.) within `if` blocks containing `br` targeting distant outer labels. Validate that the resolution correctly identifies the outer labels despite deep nesting.    - **Constraint**: The implementation should properly track and resolve distant labels in complex and deeply nested control structures.

(assert_invalid
  (module (func $deep-nested-label-resolution
    (block (if (i32.const 1)
      (then
        (block (if (i32.const 1)
          (then
            (block (if (i32.const 1)
              (then
                (block (br 4))
              )
            ))
          )
        ))
      )
    ))
  ))
  "label index out of range"
)