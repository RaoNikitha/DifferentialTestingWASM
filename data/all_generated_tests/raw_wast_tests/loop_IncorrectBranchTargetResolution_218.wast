;; 9. **Test Input: Exiting from Multiple Nested Loops**    - Description: Test nested loops where the innermost loop contains a `br` targeting one of the outer loops but resolves incorrectly due to label mismanagement.    - Constraint: Confirm exiting strategies from deeply nested loops maintain correct target integrity.    - Focus: Assess if a complex nesting hierarchy maintains correct relative label indices.

(assert_invalid
  (module
    (func $nested-loops-label-br
      (loop $outer (result i32)
        (i32.const 42)
        (loop $inner (result i32)
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)