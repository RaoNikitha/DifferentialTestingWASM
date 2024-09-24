;; **Test 7**: Attempt to call a local function where the arguments involve non-recursive globals, ensuring proper type and index validation. Verify if condition evaluation incorrectly pushes or pulls globals due to a lookup mismatch.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test (param i32) (result i32)
      (global.set $g (i32.const 4))
      (call $test (global.get $g))
    )
    (func (export "main") (result i32)
      (call $test (i32.const 2))
    )
  )
  "type mismatch"
)