;; 8. **Test 8: Combination of `nop` and Function Calls**    - **Constraint Check**: Ensure `nop` between function calls does not disrupt stack integrity or control flow.    - **Description**: Place `nop` instructions between two function calls and verify that control returns properly to the caller without side effects.

(assert_invalid
  (module 
    (func $f1 (nop) (nop))
    (func $f2 (call $f1) (nop) (call $f1))
  )
  "type mismatch"
)