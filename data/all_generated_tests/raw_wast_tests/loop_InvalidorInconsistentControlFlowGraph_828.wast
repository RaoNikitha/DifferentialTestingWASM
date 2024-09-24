;; 9. **Loop with Nested If Statements and Branch on Condition**:    - Create a loop containing nested `if` statements with `br_if` branches depending on nested conditions. Ensure context updates correctly track nested branches.    - **Constraint**: Correct mapping of conditional branches within nested structures.    - **CFG Check**: Verify the CFG includes all nested conditional branch paths.

(assert_invalid
  (module
    (func $loop-with-nested-if
      (i32.const 1)
      (loop (param i32) (result i32)
        (i32.const 2)
        (br_if 0)
        (if (result i32)
          (i32.const 3)
          (br_if 0)
          (i32.const 4)
        )
        (i32.const 5)
      )
      (drop)
    )
  )
  "type mismatch"
)