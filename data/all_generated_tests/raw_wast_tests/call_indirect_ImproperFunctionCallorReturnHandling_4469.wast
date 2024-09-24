;; 8. Test a scenario where multiple `call_indirect` instructions are consecutively executed with slightly varying indices and types to test the implementation’s consistency in type and bounds checking across multiple calls.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32) (result i32)))
    (type (func (param i32 f32)))
    (table 3 funcref)
    (elem (i32.const 0) 0 1 2)
    (func $multiple-call-indirect
      (call_indirect (type 0) (i32.const 0)) (drop)
      (call_indirect (type 1) (i32.const 1)) (drop)
      (call_indirect (type 2) (i32.const 2)) (drop)
    )
  )
  "type mismatch"
)