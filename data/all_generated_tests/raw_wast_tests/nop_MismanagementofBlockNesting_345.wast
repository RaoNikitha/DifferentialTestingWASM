;; 6. **Test Else Block followed by Nop in Nested If**: Create a function where an `if`-`else` block is nested within another block, and follow the `else` block with a `nop`. This checks if the control flow accurately skips the `nop` and exits the nested `else` block correctly.

(assert_invalid
  (module 
    (func $nested-if (result i32)
      (block 
        (if (i32.const 1)
          (then (nop))
          (else (block (if (i32.const 0) (then (nop))))))))
  "type mismatch")
)