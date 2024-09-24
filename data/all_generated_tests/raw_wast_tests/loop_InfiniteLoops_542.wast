;; 3. **Test Description**: Construct a loop with an unconditional `br 0` at the end of the loop block, which loops indefinitely.    **Constraint Checked**: Handling of unconditional branch instructions within a loop.    **Relation to Infinite Loops**: Verifies the implementation of the `br 0` behavior to ensure it properly references the current loop block and creates an infinite loop scenario.

(assert_invalid
  (module
    (func (loop
      br 0
    ))
  )
  "unconditional branch leading to infinite loop"
)