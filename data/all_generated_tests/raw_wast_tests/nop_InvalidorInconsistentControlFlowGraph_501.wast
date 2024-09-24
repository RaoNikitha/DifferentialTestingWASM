;; 2. **Test 2: `nop` in Nested Control Structures**    - **Constraint Check**: Ensure `nop` within nested blocks, if-statements, and loops does not alter control flow.    - **Description**: Write nested control structures with `nop` instructions placed within them. Check that execution proceeds through each nested level as intended.

(assert_invalid 
  (module 
    (func $nested-control 
      (block 
        (loop 
          (block 
            (if (i32.const 1) 
              (then (nop)) 
              (else (nop))
            )
            (nop)
          )
        )
      )
    )
  )
  "type mismatch"
)