;; 6. **Test Case 6**: A `loop` block where `br_table` targets include non-loop blocks.    - **Constraint**: Ensuring the `br_table` correctly interprets targets that are outside the loop context.    - **Relation to br_table Edge Case**: Verifies the robustness of target resolution within and outside loop contexts.

(assert_invalid
  (module (func $br_table_target_non_loop
    (block
      (block
        (loop (result i32)
          (i32.const 0)
          (br_table 0 1 2)
        )
      )
    )
  ))
  "br_table target not valid"
)