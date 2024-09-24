;; 2. **Nested Conditional Branching with False Condition**:    - Create a series of nested `if` blocks with `br_if` instructions inside each, controlled by conditions that are designed to be false. Observe if any branch instructions incorrectly jump despite the false conditions, which would indicate incorrect condition handling.

(assert_invalid
  (module
    (func
      (block
        (if (i32.const 0)
          (then (br_if 1 (i32.const 0)))
        )
        (block
          (if (i32.const 0)
            (then (br_if 1 (i32.const 0)))
          )
        )
      )
    )
  )
  "type mismatch"
)