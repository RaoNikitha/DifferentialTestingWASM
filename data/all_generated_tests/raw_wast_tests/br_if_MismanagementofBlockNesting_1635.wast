;; 6. **Excessively Nested `br_if` Chain Test**:    - **Description**: Make a sequence of nested `if-else` blocks, with a `br_if` in each branch that targets various enclosing blocks. This checks the management of complex nested control branches.    - **Constraint Checked**: Stack Polymorphism, Relative Label Lookup.    - **Expected Failure**: Improper managing leads the wizard_engine to OobLabel errors on conditional branches.

(assert_invalid
  (module
    (func $excessively_nested_br_if_chain
      (block
        (block
          (block
            (if (result i32) 
              (then 
                (br_if 2 (i32.const 1))
                (block
                  (br_if 1 (i32.const 1))
                )
              )
              (else
                (block
                  (br_if 0 (i32.const 1))
                )
              )
            )
          )
        )
      )
    )
  )
  "OobLabel"
)