;; 7. **Test Description**: Deeply nested `loop` structures each containing `br_if`, where each conditional branch should exit to different levels, and verify final stack state.    - **Constraint Checked**: Proper context extension and stack unwinding for `br_if` in nested loops.    - **Relation to Mismanagement of Block Nesting**: Mismanagement can lead to invalid exits and incorrect final stack state.

(assert_invalid
  (module (func $nested-loops
    (loop (param i32)
      (loop (param i32)
        (br_if 1 (i32.const 1))
        (br_if 0 (i32.const 0))
      )
      (br_if 0 (i32.const 1))
    )
    (drop)
  ))
  "type mismatch"
)