;; 3. **Single Target with Large Index**:    - Design a `br_table` with only one target and use a very large index to see how the engine responds.    - **Constraint**: Verifies that a large index does not cause buffer overflow or similar issues.    - **Edge Case**: Ensures the implementations handle invalid large indices gracefully.

(assert_invalid
  (module
    (func $large-index-br_table (result i32)
      (i32.const 4294967295)
      (block (result i32)
        (br_table 0 0 0 0 (return))
      )
    )
  )
  "type mismatch"
)