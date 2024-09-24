;; 8. Create an `if` block that performs stack operations and conditionally calls an imported function. Ensure the stack state is preserved correctly when the function is not called based on the `if` condition.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func
      (local i32)
      (i32.const 0)
      (if (then (local.set 0) (i32.const 1) (call $external_func (local.get 0))))
      (drop)
    )
  )
  "type mismatch"
)