;; 4. **Nested Block with Misaligned Stack Height**:    - Design a test with deeply nested blocks where the inner blocks modify the stack, leading to a misaligned stack height at the outer block's `end`.    - Examine if one implementation manages the stack height correctly while the other leads to stack corruption.

(assert_invalid
  (module (func $nested-block-with-misaligned-stack
    (block (result i32)
      (i32.const 42)
      (block (result i32)
        (i32.const 1)
        i32.add
      )
      (i32.const 2)
      (i32.add)
    )
  ))
  "type mismatch"
)