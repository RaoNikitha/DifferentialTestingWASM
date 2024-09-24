;; 7. **`nop` in Inline Functions and Calls**:    - Place `nop` instructions in inline or frequent function calls, analyzing the inline costs and effects on the CFG.    - Constraint: Observes how `nop` instructions are handled in frequently executed paths.

(assert_invalid
  (module (func $nop_in_inline_call (call $inner_function) (nop)) (func $inner_function))
  "function call type mismatch"
)