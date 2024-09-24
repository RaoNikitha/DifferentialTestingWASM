;; Test a loop that performs br_if on conditional values manipulated via nested function calls, ensuring operand stack consistency and proper handling of loop exits to avoid infinite loops.

(assert_invalid
  (module
    (func $test-nested-br_if-loop
      (loop (result i32)
        (call $nested-condition)
        (br_if 0)
        (call $nested-condition-2)
        (br_if 1 (i32.const 0))
      )
      (i32.const 0)
    )
    (func $nested-condition (result i32)
      (i32.const 1)
    )
    (func $nested-condition-2 (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)