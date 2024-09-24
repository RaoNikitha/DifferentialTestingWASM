;; 10. **Test Description:**     - Create module A with function(s) mixing `nop` instructions with global variable accesses. Export these functions. Module B imports these functions and accesses global variables before and after calls. Validate the global state for correctness.     - **Constraint Checked:** `nop` should not interfere with global variable accessibility and consistency.     - **Relation to Issue:** Ensures `nop` does not impact global state management across module boundaries.

 ;; (module
  (global $g (mut i32) (i32.const 0))
  (func $set (param i32) (global.set $g (local.get 0)) (nop))
  (func (export "get") (result i32) (global.get $g))
  (export "set" (func $set)))

(module
  (import "A" "set" (func $a_set (param i32)))
  (import "A" "get" (func $a_get (result i32)))
  (global $g (mut i32) (i32.const 10))
  (start $init)
  (func $init
    (call $a_set (i32.const 20)) 
    (nop)
    (assert (i32.eq (call $a_get) (i32.const 20)))
    (global.set $g (call $a_get))
    (nop))
  (func (export "check") (result i32) (global.get $g)))

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $set (param i32) (global.set $g (local.get 0)) (nop))
    (func (export "get") (result i32) (global.get $g))
    (export "set" (func $set)))
  "global state manipulation failed")