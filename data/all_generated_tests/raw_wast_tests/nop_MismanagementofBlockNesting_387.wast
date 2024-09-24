;; 8. **Deeply nested calls mixed with `nop`:** Test a function that makes deeply nested function calls and has `nop` instructions between these calls. Ensure that the function calls maintain proper control flow and stack state, checking for potential mismanagement of validation contexts in nested call setups.

(assert_invalid
  (module 
    (func $nested_calls
      (call $funcA) 
      (nop)
      (call $funcB)
      (call $funcC)
      (nop)
      (block 
        (call $funcD)
        (nop)
        (call $funcE)
      )
    )
    (func $funcA (nop))
    (func $funcB (nop))
    (func $funcC (nop))
    (func $funcD (nop))
    (func $funcE (nop))
  )
  "type mismatch"
)