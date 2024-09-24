;; 4. **Test Description**: Design a `br_table` that contains an index way outside the valid range (e.g., index 100 in a table of size 5) and confirm the proper default label action.    - **Constraint**: This test evaluates how far-out-of-bounds indices are handled by the `br_table` instruction.    - **Edge Case Relation**: Assesses the behavior of the implementation when encountering significantly invalidly large indices.

(assert_invalid
  (module
    (func $test (block (result i32) (br_table 100 (block (result i32) (br 0)))))
  )
  "type mismatch"
)