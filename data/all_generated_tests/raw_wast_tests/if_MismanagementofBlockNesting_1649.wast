;; 10. **Test 10**:    - An `if` block nested within a `block` that has several `if` blocks at different depths, using various block types.    - Ensures that the nested contexts are correctly handled, and the operand stack maintains expected heights and types through complex nesting.  These tests focus on complex nesting scenarios and control flow transitions to verify whether both implementations handle nested contexts and labeling correctly, which is critical for managing block nesting properly.

(assert_invalid
  (module
    (func $nested_if_blocks
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (block (result i64)
              (if (result i64)
                (i32.const 1)
                (then (i64.const 10))
                (else (i64.const 20))
              )
            )
          )
          (else (i32.const 5))
        )
      )
      (i32.add)
    )
  )
  "type mismatch"
)