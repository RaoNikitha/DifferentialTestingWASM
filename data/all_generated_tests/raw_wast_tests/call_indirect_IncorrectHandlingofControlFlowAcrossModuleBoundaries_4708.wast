;; 7. Export a function that modifies a global variable, and call it indirectly from another module. The test ensures that the global state is correctly updated and observed across module calls.

(assert_invalid
  (module
    (type $t0 (func))
    (global $g0 (mut i32) (i32.const 0))
    (func $f (global.set $g0 (i32.const 42)))
    (table 1 funcref (elem $f))
    (export "call_f" (func $f))
    (type $t1 (func))
    (func
      (call_indirect (type $t1) (i32.const 0))
      (global.set $g0 (i32.const 100))
    )
  )
  "type mismatch"
)