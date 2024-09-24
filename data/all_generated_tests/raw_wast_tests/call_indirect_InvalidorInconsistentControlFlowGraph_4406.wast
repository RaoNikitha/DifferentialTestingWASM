;; **Test 5**: Develop a module with multiple `call_indirect` instructions chained together, some of which are valid and some that contain deliberate type mismatches. This aims to test how each implementation accumulates and handles errors, observing any resulting CFG inconsistencies when back-to-back indirect calls generate traps.

(assert_invalid
  (module
    (type $func1 (func (param i32)))
    (type $func2 (func (param i64)))
    (table 1 funcref)
    (func $a (param i32))
    (elem (i32.const 0) $a)
    (func $test
      (i32.const 0)
      (i32.const 1)
      (call_indirect (type $func1) (i32.const 0))
      (call_indirect (type $func2) (i32.const 0))
    )
  )
  "type mismatch"
)