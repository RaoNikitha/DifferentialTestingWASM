;; 10. **Test 10: Branching Around `nop` in Nested Control Structures**:     - **Description**: Create deeply nested control structures with `nop` at critical points. Use numerous branches (`br`, `br_if`) to target labels inside and outside these structures, ensuring the labels resolve correctly.     - **Constraint**: The complex nesting and branching should handle `nop` without interfering with target resolution.     - **Relation to Incorrect Branch Target Resolution**: Tests that deeply nested branches correctly resolve their targets regardless of intervening `nop` instructions.

(assert_invalid
  (module
    (func $complex_branch (result i32)
      (block $outer
        (block $inner
          (br_if $inner (i32.const 1))
          (nop)
          (br $outer)
        )
        (i32.const 0)
      )
      (nop)
      (i32.const 42)
    )
  )
  "type mismatch"
)