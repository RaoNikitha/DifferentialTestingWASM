;; 4. Test a loop that makes non-trivial use of `br_table` to call one of several imported functions determined at runtime. Verify the correct execution path and stack handling for each case.

(assert_invalid
  (module
    (import "env" "func1" (func $func1))
    (import "env" "func2" (func $func2))
    (import "env" "func3" (func $func3))
    (func (result i32)
      (local i32)
      (i32.const 1)
      (local.set 0)
      (loop (result i32)
        (br_table 0 1 2 (local.get 0))
        (call $func1)
        (call $func2)
        (call $func3)
      )
    )
  )
  "type mismatch"
)