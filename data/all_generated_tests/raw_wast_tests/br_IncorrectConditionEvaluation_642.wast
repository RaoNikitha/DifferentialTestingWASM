;; 3. **Nested `br_if` with True and False Conditions:**    - A nested structure with two `br_if` instructions where the outer has false and the inner has true condition. Verify that only the inner branch is taken.    - Constraint Checked: Independent and correct evaluation of nested `br_if` conditions.    - Relation: Validates correct nesting and independent condition evaluation.

(assert_invalid
  (module
    (func $nested-br_if (result i32)
      (block (result i32)
        (block
          (i32.const 0)  ;; outer false condition
          (br_if 0)
          (i32.const 1)  ;; inner true condition
          (br_if 1)      ;; incorrect label causing type mismatch
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)