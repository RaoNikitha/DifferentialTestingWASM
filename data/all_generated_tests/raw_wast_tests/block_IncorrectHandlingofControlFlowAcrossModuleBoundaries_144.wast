;; 5. **Test Description**: Create a `block` that triggers a `br_table` with a label targeting an imported function, ensuring the execution flow respects the expected types and stack behavior on return.    **Constraint**: Confirm correct execution of table branches and label handling between modules.

(assert_invalid
  (module
    (func $type-br_table-invalid-block (result i32)
      (block (result i32)
        (br_table 0 1 0
          (local.get 0)
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "out of range index"
)