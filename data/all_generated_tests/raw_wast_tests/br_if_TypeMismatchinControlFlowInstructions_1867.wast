;; - **Test 8**:   Construct nested `block`-`loop` structures, where an inner loop uses `br_if` but exits pushing a type inconsistent with the enclosing block’s expected result type.   - **Reason**: Tests for enforcement of outer blocks' result type on inner loops’ branches.   - **Constraint**: Inner control structures must maintain outer result type constraints.

(assert_invalid
  (module
    (func $nested-block-loop-result-mismatch
      (block (result i32)
        (loop (result i32)
          (br_if 0 (i32.const 1) (i64.const 42))
        )
      )
    )
  )
  "type mismatch"
)