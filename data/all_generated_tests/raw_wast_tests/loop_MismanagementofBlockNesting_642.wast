;; 3. **Test: Double Nested Loop with `br_table`**    - **Description**: Test two nested loops with a `br_table` that targets both loops.    - **Constraint Being Checked**: Correct behavior of `br_table` based on depth.    - **Mismanagement**: `br_table` may incorrectly exit or restart loop.

(assert_invalid
  (module (func $double_nested_loop_with_br_table (param i32) (result i32)
    (loop $outer (result i32)
      (loop $inner (result i32)
        (br_table 0 1 (local.get 0))
      )
    )
  ))
  "type mismatch"
)