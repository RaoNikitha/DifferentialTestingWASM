;; Test 3: Use multiple `return` instructions within conditional branches, one of which follows unreachable. Reason: Validates that `return` branches correctly notwithstanding other control instructions.

(assert_invalid
  (module
    (func $conditional-multiple-returns (result i32)
      (block
        (if (i32.const 1)
          (then (return (i32.const 1)))
          (else 
            (unreachable)
            (return (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)