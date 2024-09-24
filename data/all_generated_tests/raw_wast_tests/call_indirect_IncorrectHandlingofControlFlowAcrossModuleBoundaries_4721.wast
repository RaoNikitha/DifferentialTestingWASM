;; Export a series of overloaded functions with various signatures from one module and import them all into another module. Perform indirect calls using table indexes designed to test boundary conditions and signature mismatches, ensuring that all expected traps and error conditions occur correctly

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64) (result f64)))
    (func $f1 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $f2 (param f64) (result f64) (f64.add (local.get 0) (f64.const 1.0)))
    (table funcref (elem $f1 $f2))
    (func $test
      (call_indirect (type $sig1) (i32.const 1) (i32.const 5))
    )
  )
  "type mismatch"
)