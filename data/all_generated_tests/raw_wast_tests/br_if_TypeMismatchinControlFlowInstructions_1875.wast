;; 6. **Test 6**:    - **Description**: A `block` that expects multiple results (`i32`, `f32`), followed by a `br_if` in a nested `block` supplying different types (`i32`, `f64`).    - **Constraint**: Tests type constraint adherence with `br_if` across complex operand stacks.    - **Relation to Type Mismatch**: Ensures complete type matching in more complex stack scenarios involving multiple results.

(assert_invalid
  (module
    (func $complex-type-mismatch
      (block (result i32 f32)
        (block (result i32 f64)
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)