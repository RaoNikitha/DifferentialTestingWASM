;; 6. **Test Description 6**:    - Construct a `loop` where a `br_if` is used to branch only when a condition involving multiple stack values is true. For instance, the loop should continue while the sum of two stack values remains below a threshold, verifying multi-value condition evaluations.

(assert_invalid
  (module
    (func $test (param i32 i32)
      (loop (result i32)
        (local.get 0)
        (local.get 1)
        (i32.add)
        (i32.const 10)
        (i32.lt_s)
        (br_if 0)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)