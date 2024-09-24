;; 6. **Complex Conditional Branch Targets**    - Test a loop with multiple nested blocks and complex `br_if` instructions that resolve to different labels, checking if the conditions properly resolve to legitimate branches.

(assert_invalid
  (module
    (func $complex-conditional-branch (param i32) (result i32)
      (loop (result i32)
        (block (result i32)
          (block (result i32)
            (i32.eqz (local.get 0))
            (br_if 0)
            (i32.const 1)
            (br 1)
          )
          (i32.const 2)
        )
      )
    )
  )
  "unreachable instruction"
)