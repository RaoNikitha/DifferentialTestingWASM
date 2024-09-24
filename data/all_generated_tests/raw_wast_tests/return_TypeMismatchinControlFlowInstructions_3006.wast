;; 5. **Invalid Type Mix in Multiple Blocks**:    - Design nested blocks where the outer block expects an `i32` but the inner block wrongly yields an `i64` via `return`.    - **Constraint:** Nested block checks should ensure consistent types across all levels.    - **Type Mismatch:** Verifies control flow type rules across nested structures.

(assert_invalid
  (module
    (func $invalid-type-mix-in-multiple-blocks (result i32)
      (block (result i32)
        (block (result i64)
          (br 1 (return (i64.const 0)))
        )
      )
    )
  )
  "type mismatch"
)