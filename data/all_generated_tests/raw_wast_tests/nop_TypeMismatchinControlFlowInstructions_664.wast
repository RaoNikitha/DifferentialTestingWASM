;; Construct a `block` with mixed type operations and intersperse `nop` in a way that breaks expected stack types, especially at control flow convergence points. Validate if the wizard_engine allows a mismatched type block formation.

(assert_invalid
  (module
    (func (block f32 (nop) (i32.const 42) (nop) (i64.const 64) (f64.const 1.0) (nop)))
  )
  "type mismatch"
)