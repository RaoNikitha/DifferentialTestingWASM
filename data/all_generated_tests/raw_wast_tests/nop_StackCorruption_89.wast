;; 10. An `if-else` structure with `nop` instructions in both branches to verify that the stack state is unaffected by `nop`, ensuring consistency in stack depth and values regardless of the branch taken.

(assert_invalid
  (module (func $if-else-nop (result i32)
    (if (result i32)
      (i32.const 1)
      (then (nop) (i32.const 1))
      (else (nop) (i32.const 1))
    )
  ))
  "type mismatch"
)