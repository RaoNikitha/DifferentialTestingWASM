;; 4. **Test Description**:    - Construct nested `if-else` statements with interleaved `nop` instructions inside each block. Check for any misinterpretation or invalidation.    - **Constraint Checked**: Proper validation and execution of nested control structures with intervening `nop` instructions.    - **Relation to CFG**: Confirms `nop` instructions do not introduce errors in nested control structures within the CFG.

(assert_invalid
  (module
    (func $nested-if-else (result i32)
      (if (i32.const 1)
        (then (nop))
        (else (if (i32.const 0)
               (then (nop))
               (else (nop)))))
      (i32.const 0))
    (nop))
  "type mismatch"
)