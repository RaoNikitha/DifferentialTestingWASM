;; 9. **Test 9: `br_if` within nested `if` blocks with multiple branches**    - **Constraint**: Different nested `if` blocks where the condition determines which branch, expecting correct label referencing.    - **Check**: Ensures correct control flow handling within nested conditions.    - **Relation to Edge Cases**: Ensures `br_table` correctly manages control flow across several potentially competing conditional branches.

(assert_invalid
  (module
    (func $nested-conditional-br_if
      (block
        (if (i32.const 1)
          (then (block (br_if 1 (i32.const 1))))
          (else (block (br_if 2 (i32.const 1))))
        )
      )
    )
  )
  "unknown label"
)