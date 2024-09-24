;; 5. **Test Case 5**:    - **Description**: Define an `if` block with `i32` as both the input and output types, and use `br_if` inside one of the branches to conditionally jump to a label targeting the `if` block. Provide wrong operand types deliberately.    - **Constraint**: Tests strict type enforcement in the context of conditional branches, ensuring operands match the `if` block's annotated types.

(assert_invalid
  (module
    (func $type-mismatch-br_if-in-if
      (block
        (if (result i32)
          (then
            (i32.const 1)
            (br_if 0 (i64.const 1))
          )
          (else
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)