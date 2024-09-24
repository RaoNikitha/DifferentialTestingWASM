;; 7. **Test Description**:    - **Scenario**: An exported function has a deeply nested control structure (`block` within an `if`) with a `br_if` jumping to an outer `block`.    - **Constraint**: Test proper operand stack unwinding when called from an external module.    - **Differential Focus**: Verify that both environments correctly handle the nested labels under cross-module execution, focusing on potential mismanagement in wizard_engine.

(assert_invalid
  (module
    (func $deep-nested-br_if
      (block (result i32)
        (if (i32.const 1)
          (then
            (block
              (br_if 1 (i32.const 1))
              (i32.const 2)
            )
          )
        )
      )
      (drop)
    )
    (export "deepNestedBrIf" (func $deep-nested-br_if))
  )
  "type mismatch"
)