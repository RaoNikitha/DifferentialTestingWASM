;; 2. **Test Description**: A `loop` within a `block` with an indirect `br_table` targeting an index larger than the nested `block` but less than zero.    - **Constraint Checked**: Ensures `br_table` correctly handles bounds and defaults to the correct target.    - **Relation to Mismanagement of Block Nesting**: Misreferencing may occur if the implementation incorrectly interprets label stack boundaries.

(assert_invalid
  (module (func $nested-loop-br_table
    (block
      (loop
        (br_table 2 0 (i32.const 0))
        (unreachable)
      )
    )
  ))
  "jump target"
)