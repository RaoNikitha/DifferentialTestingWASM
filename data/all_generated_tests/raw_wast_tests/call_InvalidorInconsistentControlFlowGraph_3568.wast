;; Test 7: Design a test where global variables affect the function index, and changes to the globals can lead to an invalid function call. This tests if the CFG properly accounts for state changes in the globals and maintains consistent error handling throughout.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $f1 (type 0))
    (func $f2 (type 0))
    (type (func))
    (func (global.set $g (i32.const 2)))
    (table funcref (elem $f1 $f2))
    (func (call_indirect (type 0) (global.get $g)))
  )
  "unknown function"
)