;; 4. **Test Case 4**:    - **Description**: Use a `block` with an input type of `i64` but an output type of `i32`. Inside the block, use `br_if` to conditionally exit, supplying both `i32` and `i64` to test type mismatches.    - **Constraint**: Ensures the `br_if` instruction properly respects the output type of the enclosing block, identifying issues in type conversion logic.

(assert_invalid
  (module
    (func
      (block (result i32)
        (i64.const 1)
        (i32.const 1)
        (br_if 0 (i32.const 1))
      )
      (drop)
    )
  )
  "type mismatch"
)