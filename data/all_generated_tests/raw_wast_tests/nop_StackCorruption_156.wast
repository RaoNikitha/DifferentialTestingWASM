;; Test 7: Use `nop` within a function that executes a conditional branch (`if-else` construct) and verify through multiple branches that the stack is correctly managed without corruption.

(assert_invalid
  (module
    (func $if-else-nop 
      (if (i32.const 1)
        (then (nop) (nop))
        (else (nop) (nop))
      )
    )
  )
  "type mismatch"
)