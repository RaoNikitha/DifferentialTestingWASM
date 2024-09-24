;; 9. **Test Description**: Use a nested `loop` inside a `block` with multiple `br_if` conditionals targeting different depth labels. Ensure the CFG maintains accurate operand handling based on target depths.    - **Constraint Checked**: Depth-based operand consistency.    - **CFG Relation**: Ensures the CFG maintains the correct operand stack across different branching levels.

(assert_invalid
  (module
    (func $nested-loop-br_if
      (block
        (loop
          (br_if 1 (i32.const 1))
          (br_if 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)