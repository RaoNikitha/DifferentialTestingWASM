;; 6. **Test with Non-Polymorphic Stack Behavior:**    - **Description:** Create a `br_table` instruction within a block that wrongly assumes non-polymorphic stack behavior, causing operand type mismatches across branches.    - **Constraint Checked:** Verifying CFG accurately supports the stack-polymorphic nature of `br_table`.

(assert_invalid
  (module (func $non-polymorphic-stack-behavior
    (block $outerBlock
      (block $innerBlock
        (br_table 0 1 (i32.const 0) (i64.const 0))
      )
    )
  ))
  "type mismatch"
)