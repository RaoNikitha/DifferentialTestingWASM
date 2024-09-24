;; 7. **Forward Branch in `if` Block Failing to Match Stack Height**:    - Construct a scenario where the `if` block contains a branch instruction that fails to match the expected stack height, consequently breaking CFG consistency.    - *Constraint*: Ensuring the stack height remains consistent with the block type’s requirements on branches.    - *Relation to CFG*: Validates CFG’s ability to manage and validate forward branches correctly.

(assert_invalid
  (module
    (func $forward-branch-stack-height-mismatch
      (if (result i32)
        (i32.const 1)
        (then
          (br 0)
          (i32.const 1)
        )
        (else
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)