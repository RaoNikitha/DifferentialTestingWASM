;; 6. Create a loop that modifies the execution state then calls an imported function which changes it again before returning control. Ensure consistent state is maintained between the looping module and the called module.

(assert_invalid
  (module
    (import "mod" "func" (func $ext_func (param i32) (result i32)))
    (func $test_func (result i32)
      (i32.const 10)
      (loop (result i32)
        (call $ext_func (i32.const 5))
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)