;; 5. **Test: Br_Table with Non-Integer Type Indices**    - **Description**: Use a `br_table` where indices are not strictly integers (if the type system allows), followed by a `call` with type-specific requirements.    - **Constraint**: Check if the `br_table` handles non-integer indices correctly and assess the impact on subsequent stack operations for the `call`.    - **Edge Case**: Tests the robustness of type-checking mechanisms in `br_table` indexing and subsequent stack consistency for calls.

(assert_invalid
  (module
    (func $br_table_non_int_call
      (block
        (br_table 1 (f32.const 3.14))
        (call 0)
      )
    )
    (func (result i32))
  )
  "type mismatch"
)