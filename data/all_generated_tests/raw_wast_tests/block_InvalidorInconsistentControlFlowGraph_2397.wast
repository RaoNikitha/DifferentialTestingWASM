;; 8. **Test a nested block with deeply nested br_if and br_table instructions directing to invalid non-enclosing labels**:    - **Constraint Checked**: Checks label index correctness and their scopes.    - **Reasoning**: Mismanaged nested labels result in invalid branches, testing CFG construction.

(assert_invalid
  (module (func $nested-br_if-br_table (result i32)
    (block (result i32)
      (block
        (block
          (br_if 3 (i32.const 0))
        )
        (br_table 2 0 (i32.const 1))
      )
    )
  ))
  "invalid label"
)