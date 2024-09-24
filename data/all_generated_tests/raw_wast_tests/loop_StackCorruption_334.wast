;; 5. **Test 5**:    - **Description**: Construct a loop with mixed type pop-push operations involving multiple data types (i32, i64, etc.).    - **Constraint**: Type checking and coercion rules within loops.    - **Stack Corruption Check**: Confirm no type mismatch occurs that could lead to stack corruption.

(assert_invalid
  (module
    (func $type-mixed-push-pop
      (block (result i32)
        (i32.const 42)
        (loop (result i32)
          (i64.const 100)
          (drop)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)