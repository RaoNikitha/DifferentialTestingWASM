;; 1. Test an exported function that loops infinitely, which makes an indirect call to an imported function that modifies global state. Check for proper global state handling and recursion depth limits.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (import "env" "update_global" (func $update_global (type $sig)))
    (global $counter (mut i32) (i32.const 0))
    (func $test_loop
      (loop $label (br $label))
    )
    (func $main
      (call $test_loop)
    )
    (export "main" (func $main))
  )
  "unreachable code"