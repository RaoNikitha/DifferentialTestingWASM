;; 9. **Test Description**: `br_table` using negative and unusually large indices to trigger default branches, with `return` instructions to check error handling and default path unwinding.    - **Constraint**: Tests robustness of the `return` implementation, particularly in default path handling arising from incorrect indices.

(assert_invalid
  (module
    (func $br_table_with_return
      (block
        (block
          (br_table 0 1 (i32.const -1) (return))
        )
      )
    )
  )
  "type mismatch"
)