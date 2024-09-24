;; 10. **Test Nested Br Instructions with Different Blocks:**    - **Description:** Implement nested `br` instructions where branches target different blocks at various nesting levels.    - **Reasoning:** Ensures that nested branches preserve operand stack states accurately.    - **Constraint:** Proper maintenance of operand types and stack heights during branching.    - **Relation to Stack Corruption:** Nested branching, if improperly managed, may lead to stack inconsistencies across highly nested structures.

(assert_invalid
  (module
    (func $nested-br (result i32)
      (block $outer (result i32)
        (i32.const 1)
        (block $inner (result i32)
          (i32.const 2)
          (br 1) ;; Branch to $outer
        )
        (br 0) ;; Branch to $outer
      )
    )
  )
  "type mismatch"
)