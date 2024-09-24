;; 9. **Test: Zero Case Handling in `br_table` with Return**    - **Description**: Configure `br_table` with zero indices and ensure that it leads to an immediate `return`. This tests how zero cases are processed prior to executing a return.    - **Constraint**: Ensuring accurate behavior when dealing with minimal or zero indices.

(assert_invalid
  (module
    (func $br_table-zero (result i32)
      (block (br_table 0 (return))) (i32.const 0)
    )
  )
  "type mismatch"
)