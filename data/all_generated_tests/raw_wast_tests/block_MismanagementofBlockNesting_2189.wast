;; 10. **Nested Blocks with Unstructured Branch Patterns**:    - Create tests with highly nested blocks where `br_table` references unstructured branch patterns, jumping to multiple depth levels in an unexpected order. Validate that branches target the correct block level and maintain structured control flow. Mismanagement may break the structured flow, leading to incorrect block exits.

(assert_invalid
  (module (func $nested-blocks-br-table (result i32)
    (block $outer (result i32)
      (block $middle (result i32)
        (block $inner (result i32)
          (br_table 2 0 1 (i32.const 1))  ;; Jump out to $outer, then $middle, then $inner in unexpected order
        )
        (i32.const 0)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)