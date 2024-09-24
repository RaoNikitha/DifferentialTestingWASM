;; 5. Insert `nop` inside an `if` condition's true branch and verify that the if-else control flow remains consistent.    **Constraint:** Ensure `nop` does not affect the conditional branching.

(assert_invalid
  (module
    (func $example (result i32) 
      (if (i32.const 1)
        (then (nop))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)