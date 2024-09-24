;; 10. **Test: Conditional Branch with Multiple Return Paths**    - **Description:** Implement a block with a `br_if` that branches out if a condition is met, leading to different return paths of a function call sequence. Ensure correctness in the stack and return values.    - **Constraint Check:** Ensures that the stack correctly unwinds and all return paths are accurate upon executing nested conditional branches.

(assert_invalid
  (module
    (func $test-conditional-branch-multiple-return-paths (result i32)
      (block (result i32)
        (block (result i32)
          (br_if 0 (i32.const 1) (i32.const 42))
          (i32.const 99)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)