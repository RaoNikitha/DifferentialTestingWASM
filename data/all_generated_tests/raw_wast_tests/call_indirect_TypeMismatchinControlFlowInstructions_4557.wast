;; 6. Create a WebAssembly function `f4` that takes an `i32` and returns an `i32`. Use `call_indirect` with a `funcref` that matches `f64 -> f64`. Test whether the trap occurs due to method signature constraints.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64) (result f64)))
    (func $f (param i32) (result i32) (i32.const 0))
    (table funcref (elem $f))
    (func
      (call_indirect (type $sig2) (i32.const 0))
    )
  )
  "type mismatch"
)