;; 3. **Test Description:**    Evaluate an `if` statement where a call inside the `else` block invokes an imported function that results in a trap (e.g., division by zero). Validate that the trap is properly raised and handled at the boundary between modules upon a false condition.

(assert_invalid
  (module
    (import "env" "trap_func" (func $trap_func (result i32)))
    (func (result i32)
      i32.const 0
      if (result i32)
        i32.const 1
      else
        call $trap_func
      end
    )
  )
  "trap handling"
)