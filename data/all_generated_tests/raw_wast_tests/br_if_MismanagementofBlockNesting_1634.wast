;; 5. **Mismanaged Block Exit with Stack Values**:    - **Description**: Create a nested `block` that expects to return certain types and use a `br_if` inside the inner block without enough stack values matching the required types. This tests how block "output types" are validated.    - **Constraint Checked**: Operand Stack.    - **Expected Failure**: wizard_engine might throw an `EmptyValueStackExpecting` error due to insufficient or incorrect stack values.

(assert_invalid
  (module (func $mismanaged-block-exit-with-stack-values
    (block (result i32)
      (block
        (br_if 1 (i32.const 1))
      )
      (i32.const 42)
    )
  ))
  "type mismatch"
)