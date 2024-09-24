;; 9. **Test Description**: Ensure `if` with `then` block `br_table` referencing indices that exceed stack depth is managed correctly.    - **Constraint**: Validate that stack management and control flow respect stack limits and proceeds without undefined behavior.    - **Relation to Edge Case**: Tests boundary conditions where index targets relate to stack accessibility and depth.

(assert_invalid
  (module
    (func $test-if-br_table (param i32) (result i32)
      (if (result i32)
        (i32.const 1)
        (then (br_table 0 1 (local.get 0)))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)