;; 3. **Test Description:**    Evaluate an `if` statement where a call inside the `else` block invokes an imported function that results in a trap (e.g., division by zero). Validate that the trap is properly raised and handled at the boundary between modules upon a false condition.

(assert_invalid
  (module
    (import "env" "div" (func $div (param i32 i32) (result i32)))
    (func $test
      (if (result i32)
        (i32.const 0)
        (then (i32.const 1))
        (else (call $div (i32.const 1) (i32.const 0)))
      )
    )
  )
  "unreachable executed"
)