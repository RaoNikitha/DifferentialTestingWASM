;; 8. **Test Name: Incorrect Stack on Nested Block Branch**    - Form a nested block structure where an inner block uses `br` to exit multiple levels, but the operand stack does not meet the requirements of the outer block. Checks for stack consistency.

(assert_invalid
  (module
    (func $incorrect-stack-nested-branch
      (block (result i32)
        (block
          (i32.const 42)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)