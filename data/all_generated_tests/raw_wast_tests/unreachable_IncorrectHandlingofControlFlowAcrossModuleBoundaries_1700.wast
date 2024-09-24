;; Test 1: Call to an imported function that is immediately followed by an unreachable instruction. Check if execution stops after the call or if the unreachable instruction affects the execution.

(assert_invalid
  (module
    (func $func1 (import "env" "func1"))
    (func (call $func1) (unreachable) (i32.const 1))
  )
  "type mismatch"
)