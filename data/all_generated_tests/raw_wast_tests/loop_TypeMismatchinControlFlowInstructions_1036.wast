;; 7. **Test for Conditional Branch with Wrong Types**: Design a `br_if` within a `loop` where the condition uses incorrect types, like `[i64] -> [void]`, while the loop’s block type expects `[i32] -> [i32]`. This tests if conditional branches validate type consistency.

(assert_invalid
  (module
    (func $conditional-branch-type-mismatch
      (loop (result i32)
        (i64.const 0)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)