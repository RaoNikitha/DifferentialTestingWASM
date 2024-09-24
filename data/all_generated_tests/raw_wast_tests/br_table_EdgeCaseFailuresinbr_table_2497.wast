;; 7. **Unwind Stack Correctly Before Branch**:    Create a scenario where the `br_table` instruction needs to unwind the stack significantly before branching to ensure the stack is managed correctly and the proper state is maintained post-branch.

(assert_invalid
  (module
    (func $unwind-stack-before-branch
      (block (result i32)
        (block (result i32)
          (i32.const 0) (i32.const 1) (i32.const 2)
          (br_table 0 0 (i32.const 3))
        )
        (i32.eqz) (drop)
      )
    )
  )
  "type mismatch"
)