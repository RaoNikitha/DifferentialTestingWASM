;; 8. Test behavior when a `br_if` conditional jump depends on the result of a `call_indirect` that traps, to see if each implementation correctly handles propagation of trap signals aborting the conditional evaluation.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem $f))
    (func $f (param i32))
    (type $sig (func (param i32)))
    (func $test
      (br_if 0 (call_indirect (type $sig) (i32.const 0) (i32.const 0)))
    )
  )
  "type mismatch"
)