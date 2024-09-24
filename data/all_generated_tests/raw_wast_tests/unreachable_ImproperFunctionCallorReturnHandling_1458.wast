;; 9. Test a function that first executes a legitimate `call_indirect`, followed by an `unreachable`. Ensure the program traps as expected if it attempts to execute beyond the indirect call due to the unreachable.

(assert_invalid
  (module
    (type $t0 (func))
    (table 1 funcref)
    (elem (i32.const 0) $t0)
    (func $test
      (call_indirect (type $t0) (i32.const 0))
      (unreachable)
    )
  )
  "type mismatch"
)