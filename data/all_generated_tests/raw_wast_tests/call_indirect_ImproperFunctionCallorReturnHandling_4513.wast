;; 2. Design a test where `call_indirect` references a table containing a function with a signature mismatching the expected function type indexed by `typeidx`. The test should validly execute the check for type conformity and result in a trap.

(assert_invalid
  (module
    (type $expected (func (param i32)))
    (type $actual (func (param f64)))
    (func $test_func (param f64))
    (table funcref (elem $test_func))
    (func (call_indirect (type $expected) (i32.const 0)))
  )
  "type mismatch"
)