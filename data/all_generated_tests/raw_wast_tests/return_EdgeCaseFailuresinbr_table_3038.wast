;; 7. **Test: `br_table` Within If-Else Blocks with Return**    - **Description**: Embed `br_table` instructions within conditional blocks (`if-else`), with each branch leading to a `return`. This checks whether the correct path is taken and returns properly from within conditional blocks.    - **Constraint**: Ensuring conditionally executed `br_table` paths respect the `return` behavior.

(assert_invalid
  (module
    (func $br_table-in-if-else (result i32)
      (if (i32.const 1)
        (then
          (br_table 0 0 (return))
        )
        (else
          (br_table 0 1 (return))
        )
      )
    )
  )
  "type mismatch"
)