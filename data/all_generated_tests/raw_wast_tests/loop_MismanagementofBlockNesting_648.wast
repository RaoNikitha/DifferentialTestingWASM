;; 9. **Test: Triple Nested Loop with Complex Branching**    - **Description**: Three nested loops with complex branching including `br_table` and multiple levels of `br_if`.    - **Constraint Being Checked**: Proper handling of deeply nested loops and multi-target branches.    - **Mismanagement**: Branches misinterpreting nesting depth and causing wrong loop exits.

(assert_invalid
  (module
    (func $triple-nested-loop-complex-branching
      (block
        (loop (result i32)
          (i32.const 0)
          (loop (result i32)
            (i32.const 1)
            (loop (result i32)
              (i32.const 2)
              (br_table 0 1 2 (i32.const 0))
              (if (i32.eqz (i32.const 3)) (br 2)) 
              (br 1)
            )
          (drop))
          (i32.add)
        (drop))
        (i32.add)
      )
    )
  )
  "type mismatch"
)