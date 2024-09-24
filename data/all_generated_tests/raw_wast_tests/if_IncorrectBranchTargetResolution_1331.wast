;; 2. **Multiple Nested `if` Instructions with Branches**:    - Construct multiple nested `if` blocks with both true and false conditions leading to various labels.    - Include `br` instructions targeting specific levels of nesting.    - This test examines whether the relative indexing and context propagation correctly resolve branch targets in nested conditions.

(assert_invalid
  (module
    (func $nested-if-with-branches (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 0)
          (if (result i32)
            (then (br 1))
            (else (br 0))
          )
        )
        (else
          (i32.const 2)
          (if (result i32)
            (then (br 1))
            (else (br 0))
          )
        )
      )
    )
  )
  "type mismatch"
)