;; 8. **Test Description**: Nested `loop`, `block` with a conditional `br_table` where one target index refers to an outermost block and one to the innermost loop.    - **Constraint Checked**: Evaluates correct handling of mixed blocks and loops in `br_table`.    - **Relation to Mismanagement of Block Nesting**: Misinterpretation of nesting depth causes failures in determining the right target.

(assert_invalid
  (module
    (func $mixed-block-nest (param i32) (result i32)
      (loop (result i32)
        (block (br_table 0 1 (local.get 0)))
      )
    )
  )
  "type mismatch"
)