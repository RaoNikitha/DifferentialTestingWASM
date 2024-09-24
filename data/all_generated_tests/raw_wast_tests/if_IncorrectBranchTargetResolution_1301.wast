;; 2. **Test Nested Ifs with Complex Branch Targets**:    Construct nested `if` blocks where the inner block branches to an outer block and includes `else` structures. Ensure the inner branch target is correctly resolved and follows control flow rules, to detect any incorrect nesting behavior.

(assert_invalid
  (module
    (func $nested-if-complex-branch-target
      (i32.const 1)
      (if (result i32)
        (then 
          (i32.const 2)
          (if (result i32)
            (then 
              (i32.const 3)
              (br 1)
            )
            (else 
              (i32.const 4)
            )
          )
        )
        (else 
          (i32.const 5)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)