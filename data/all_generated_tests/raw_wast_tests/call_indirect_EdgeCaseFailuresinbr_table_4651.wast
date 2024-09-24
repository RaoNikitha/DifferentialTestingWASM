;; 10. Create a highly nested scenario with `call_indirect` leading into complex `br_table` structures that require deep dynamic verification, testing the robustness of type conformity and boundary checks.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (param i32) (br_table 0 (i32.const 0)))
    (func $nested-call-indirect
      (block $outer
        (loop $loop
          (call_indirect (type $sig2) (i32.const 0) (i32.const 10))
        )
      )
    )
  )
  "type mismatch"
)