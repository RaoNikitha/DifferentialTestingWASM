;; Import a function from another module with a signature `(f32, f32) -> (f64)`, then call it indirectly with an operand stack missing one argument. This checks the catching of operand underflow when transitioning control between modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external (param f32 f32) (result f64)))
    (type $sig (func (param f32 f32) (result f64)))
    (table funcref (elem $external))
    (func (call_indirect (type $sig) (i32.const 0) (f32.const 1.0)))
  )
  "type mismatch"
)