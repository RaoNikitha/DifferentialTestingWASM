;; Test 8: Set up a test where incorrect function index validation allows an out-of-bounds call that leads to an 'unreachable' instruction.

(assert_invalid
  (module
    (func $out_of_bounds_function (param i32) (result i32)
      (call 5 (i32.const 0))
    )
    (func (param i32 i32))
  )
  "unknown function"
)