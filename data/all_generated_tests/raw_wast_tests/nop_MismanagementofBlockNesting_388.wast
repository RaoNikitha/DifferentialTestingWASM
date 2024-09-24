;; 9. **Nested `loop` with mixed control structures and `nop`:** Construct nested loops combined with other control structures (`block`, `if`, `else`), interspersed with `nop`. Ensure the loops exit and continue as expected without influence from `nop`, highlighting potential validation context reinitialization errors.

(assert_invalid
  (module
    (func $nested-loop
      (loop (if (i32.const 1)
        (then (nop))
        (else (block (nop))))
        (br 1))
      (nop)))
  "type mismatch"
)