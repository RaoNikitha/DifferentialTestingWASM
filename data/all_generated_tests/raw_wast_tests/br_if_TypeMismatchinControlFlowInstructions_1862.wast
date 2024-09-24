;; - **Test 3**:   Nest multiple `if` statements, where an inner `br_if` pushes a value type different from what the outer `if` expects (e.g., inner `if` pushing `i32` while outer expects `f64`).   - **Reason**: Ensures nested control structures adhere strictly to expected type constraints.   - **Constraint**: Nested types must match the encompassing control structure’s expected result type.

(assert_invalid
  (module
    (func
      (block
        (block 
          (if (i32.const 1) (then (br_if 0 (f64.const 1.0)))))
      )
    )
  )
  "type mismatch"
)