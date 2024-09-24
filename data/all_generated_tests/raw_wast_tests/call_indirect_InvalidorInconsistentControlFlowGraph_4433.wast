;; Generate a script that includes an indirect call to a function utilized within a conditional branch, where one branch further includes another indirect call. This tests the correct inline expansion and control flow paths in conditions.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (type $sig1) (param i32) (result i32)
      (call_indirect (type 0) (local.get 0) (i32.const 0))
    )
    (func $main (param i32) (result i32)
      (if (result i32) (i32.eqz (local.get 0))
        (then (call_indirect (type 0) (i32.const 0) (i32.const 0)))
        (else (call_indirect (type 1) (i32.const 0) (i32.const 0))))
    )
  )
  "type mismatch"
)