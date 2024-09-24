;; 10. Test a variadic function containing `nop` instruction placements before handling variable arguments and before `return`, to ensure the correct handling of variable arguments and that the return value accurately reflects expectations.

(assert_invalid
  (module (func $type-variadic (param i32) (result i32) (nop)))
  "type mismatch"
)