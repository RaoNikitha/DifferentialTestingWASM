;; 8. **Test Conditional Skip with Nested Branches**:    Use deep nesting with branches leaving the `if` block and validate if conditional skips and jumps align correctly without the breakdown of the stack discipline and branch target resolution mechanism.

(assert_invalid
  (module (func $nested-branches (result i32)
    (block (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (then
          (block (result i32)
            (br 1)
            (i32.const 2)
          )
          (unreachable)
        )
        (else
          (block (result i32)
            (br 0)
            (i32.const 3)
          )
          (unreachable)
        )
      )
    )
  ))
  "type mismatch"
)