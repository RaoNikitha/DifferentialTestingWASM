;; 4. **Test: Multiple `br_table` with Sequential Returns**    - **Description**: Function contains multiple `br_table` statements, each followed immediately by `return` instructions. The test ensures each `return` is correctly executed, and the function exits as expected.    - **Constraint**: Validating proper execution of multiple successive `return` instructions despite intermediate `br_table` jumps.

(assert_invalid
  (module
    (func $br_table-sequential-return (result i32)
      (block
        (block
          (br_table 0 1 (i32.const 1))
          (return (i32.const 0))
        )
        (return (i32.const 0))
      )
    )
  )
  "type mismatch"
)