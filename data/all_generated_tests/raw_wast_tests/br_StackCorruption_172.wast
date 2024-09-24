;; 3. **Test Description:**    - Implement a series of nested `if` statements with various `br` instructions in different branches. Each `br` should target different levels of nested blocks. Monitor the operand stack for any inconsistencies post-branch to check for potential stack underflows or overflows.

(assert_invalid
  (module
    (func $nested-if-branch-test (result i32)
      (block
        (block
          (block
            (if (i32.const 1)
              (then 
                (br 2)
              )
              (else
                (block
                  (if (i32.const 0)
                    (then
                      (br 1)
                    )
                    (else
                      (br 3)
                    )
                  )
                )
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "unknown label"
)