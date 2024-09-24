;; 2. **Test Description**:    A sequence of nested `loop` instructions interspersed with `nop` instructions will be tested. This examines if the control flow correctly re-enters the loops without interruptions caused by the `nop` instructions.

(assert_invalid
  (module
    (func $nested-loops (loop $outer (nop) (loop $inner (nop) (br $outer))))
  )
  "type mismatch"
)