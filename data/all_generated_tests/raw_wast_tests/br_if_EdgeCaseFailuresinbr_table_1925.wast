;; 6. **Test Nested `br_table` with Empty Operand Stack**:    - **Description**: Nest `br_table` instructions within control structures without sufficient operands on the stack.    - **Reasoning**: Checks nested structures’ stack state integrity.    - **Edge Relation**: Reflects on the stack polymorphism and nesting depth interpretation.

(assert_invalid
  (module
    (func $nested-br_table-empty-stack
      (block
        (loop
          (br_table 0 0 (br_table 0 1 (i32.const 1)))
        )
      )
    )
  )
  "type mismatch"
)