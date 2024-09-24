;; 4. **Test Description**: A sequence of `call_indirect` instructions within a loop, where each indirect call pertains to a distinct function type. This checks if the loop correctly handles switching function types in repeated calls indirectly within the nested structure.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64) (result f64)))
    (table funcref (elem (ref.func $f1) (ref.func $f2)))
    (func $f1 (type $sig1) (param i32) (result i32) (local.get 0))
    (func $f2 (type $sig2) (param f64) (result f64) (local.get 0))
    (func $loop-test
      (loop
        (call_indirect (type $sig1) (i32.const 0) (i32.const 1))
        (call_indirect (type $sig2) (i32.const 1) (f64.const 1.0))
        (br 0)
      )
    )
  )
  "type mismatch"
)