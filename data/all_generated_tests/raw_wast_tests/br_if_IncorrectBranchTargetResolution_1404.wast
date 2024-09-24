;; 5. **Test Description**: Develop a nested `loop` within a `block`, with `br_if` aimed at the loop based on a condition evaluated inside the block. Confirm the correct label target.    - **Constraint Checked**: Nested structure's label resolution for `loop` within a `block`.    - **Related Issue**: Ensure correct label index computation for nested loops inside blocks.

(assert_invalid
  (module (func $nested-loop-in-block
    (block (loop (br_if 1 (i32.const 1))))
  ))
  "invalid target for `br_if`"
)