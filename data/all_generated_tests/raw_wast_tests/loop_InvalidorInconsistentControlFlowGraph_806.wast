;; 7. **Test Nested Loops with Incorrect Blocktype**:    - Create nested `loop` instructions where the inner loop has a block type that does not match the function type required by the enclosing loop context.    - **Constraint**: Nested loops must respect their respective blocktypes.    - **CFG Impact**: Incorrect nesting can cause the CFG to misinterpret loop boundaries.

(assert_invalid
  (module
    (func $nested-loop-incorrect-blocktype
      (result i32)
      (loop (result f32)
        (loop (result i32)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)