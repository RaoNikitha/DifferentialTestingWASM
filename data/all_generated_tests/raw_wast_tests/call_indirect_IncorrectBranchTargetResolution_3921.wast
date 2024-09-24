;; 10. Create a WebAssembly module with combination of `call_indirect` and global variable updates followed by branches. Mismanagement of function signatures leading to incorrect branch targets, causing logical errors or premature exit from loops. ```

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (global $g (mut i32) (i32.const 0))
    (func $callee (param i32) (result i32)
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (i32.add (local.get 0) (i32.const 42))
    )
    (elem (i32.const 0) $callee)
    (func (result i32)
      (local $i i32)
      (call_indirect (type 0) (global.get $g) (i32.const 0))
      (br_if 0 (i32.eqz (call_indirect (type 0) (i32.const 1) (i32.const 0))))
      (global.set $g (i32.add (global.get $g) (i32.const -1)))
      (i32.const 0)
    )
  )
  "type mismatch or invalid function index usage"
)