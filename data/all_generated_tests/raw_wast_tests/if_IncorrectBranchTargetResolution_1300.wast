;; 1. **Test Unresolved Branch to Outer Block**:    Create an `if` block with conditional branching that attempts to jump to an outer block using a branch instruction. Verify that the jump correctly resolves to the label of the outer block, ensuring no internal misinterpretation of label indices.

(assert_invalid
  (module
    (func (block
      (if (result i32)
        (i32.const 1)
        (then
          (block (br 1))
        )
        (else
          (i32.const 0)
        )
      )
      (drop)
    ))
  )
  "type mismatch"
)