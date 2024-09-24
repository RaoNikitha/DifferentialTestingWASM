;; 7. **Test Description**: Design a test where `br` targets a label within a different branch scope, creating a mismatched CFG where the target is not structurally nested.    - **Constraint**: Checks the comprehensive enforcement of structured control flow, ensuring no jumped targets to non-well-nested labels.

(assert_invalid
  (module 
    (func (block
      (if (i32.const 1)
        (then (block (br 1)))
      )
    ))
  )
  "invalid jump target: non-well-nested label"
)