;; 2. **Test: Loop with Nested `if` Block**    - **Description**: Test a loop with an embedded `if` block. Use `br_if` to conditionally exit to the loop.    - **Constraint Being Checked**: Proper nesting of `if` within loop and conditional branching.    - **Mismanagement**: Incorrect interpretation of the boundary between `if` and loop.

(assert_invalid
  (module (func $nested-if-loop
    (loop $label (block
      (i32.const 0)
      (br_if 1 (i32.eqz (get_local 0)))
      (br $label))
      (i32.const 1)
      (if (i32.eqz (get_local 0))
        (then (return))
      )
    ))
  ))
  "type mismatch"
)