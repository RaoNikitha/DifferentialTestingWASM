;; 3. **Test 3**: Test nested conditional branches (`if`-`else`) with `nop` instructions placed in both branches and within nested blocks. Validate that `nop` does not change the flow of control and that the correct block depth is maintained.

(assert_invalid
  (module (func $conditional-block (block (if (i32.const 1) (then (nop)) (else (nop)))))
  "type mismatch"
))