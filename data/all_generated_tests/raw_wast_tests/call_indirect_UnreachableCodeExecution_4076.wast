;; Use `call_indirect` to call a function with a different number of parameters and check if parameter count mismatches push the execution to an `unreachable` statement, trapping the execution properly.

(assert_invalid
  (module
    (type $sig (func (param i32 i32)))
    (func $f (param i32 i32))
    (table funcref (elem $f))
    (func $type-param-count-mismatch
      (call_indirect (type $sig) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)