;; 8. **Dummy Load Operations with Branches**    - Implement loops combining dummy memory load operations (`i32.load`, `i32.store`) followed by conditional branches (`br_if`). Confirm the stack remains valid with intact values post-load and conditional operations.

(assert_invalid
  (module
    (func $invalid-loop-branch
      (i32.const 0)
      (i32.store)
      (loop (result i32)
        (i32.load)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)