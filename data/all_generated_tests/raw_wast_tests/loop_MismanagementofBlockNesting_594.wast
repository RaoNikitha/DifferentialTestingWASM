;; 5. **Complex Nested Structures with Mixed Branches**:    - Test Description: Create an intricate module featuring a mix of nested loops, blocks, and conditions where branches (`br`, `br_if`, and `br_table`) target various nesting depths.    - Constraint: Ensure each branch instruction correctly reinitializes or redirects control flow to the intended block or loop.    - Relation: This comprehensive test validates general nested structure handling and label management, exposing any inconsistency in control flow resolution.

(assert_invalid
  (module
    (func $complex_nested_structure
      (block (loop (result i32)
        (i32.const 1)
        (if (i32.eqz (i32.const 0))
          (then (br 1))
          (else
            (block (loop (result i32)
              (i32.const 2)
              (br_if 0 (i32.const 1))
              (br_table 0 1 (i32.const 2))
            ))
          )
        )
      ))
    )
  )
  "type mismatch"
)