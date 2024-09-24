;; 9. **Backward Branching Type Mismatch**    - Use backward branches where the operands required by the branch do not match the types consumed by the restarted block, focusing on backward branch validation.

(assert_invalid
  (module
    (func $backward-branch-type-mismatch
      (loop (param i32)
        (block
          (br_table 0 0 (i32.const 1) (i64.const 42))
        )
      )
    )
  )
  "type mismatch"
)