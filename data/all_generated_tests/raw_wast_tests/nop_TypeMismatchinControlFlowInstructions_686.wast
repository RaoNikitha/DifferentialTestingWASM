;; Test 7: Place `nop` inside a `loop`, followed by a type-changing instruction (`f64.reinterpret/i64`). The loop is expected to produce an `i64` type. Verify type mismatches at loop-boundary.

(assert_invalid
  (module (func (result i64) (loop (nop) (f64.reinterpret_i64))))
  "type mismatch"
)