;; 10. **Test 10: `nop` Interacting with Label Branching**     - **Constraint Check**: Validate `nop` instructions placed around label and branch instructions do not affect target labels or branching paths.     - **Description**: Insert `nop` before and after label and branch instructions and ensure that branching behaves as expected without introducing unreachable code or incorrect branches.

 ;; (module
  (func $test10
    (block $label0
      (nop)
      (br $label0)
      (nop)
    )
    (nop)
  )
)