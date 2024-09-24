;; Design a scenario where multiple indirect calls are made sequentially, each dependent on the result of the previous one with different conditional checks on each step. This tests whether the CFG can handle sequential dependencies and maintain accurate control flow mapping across multiple indirect calls.

(assert_invalid
  (module
    (type $sig_i (func (param i32) (result i32)))
    (type $sig_v (func))
    (table funcref (elem $f1 $f2))
    (func $f1 (param i32) (result i32) 
      (if (result i32) (i32.eqz (local.get 0)) 
        (i32.const 0)
        (i32.add (local.get 0) (i32.const 1))
      )
    )
    (func $f2 (param i32) (result i32)
      (call_indirect (type $sig_i) (local.get 0) (i32.const 0))
    )
    (func $main (param i32)
      (call_indirect (type $sig_i) (call_indirect (type $sig_i) (local.get 0) (i32.const 0)) (i32.const 1))
    )
  )
  "type mismatch"
)