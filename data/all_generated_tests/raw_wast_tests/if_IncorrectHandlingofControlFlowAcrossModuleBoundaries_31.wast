;; 2. Create an `if` block with nested `if` blocks, and in the innermost `if`, call an imported function that changes the control flow by returning a different type than expected. Verify if the outer `if` blocks handle the flow correctly.

(assert_invalid
  (module
    (import "env" "change_control" (func $change_control (result i64)))
    (func $test
      (if (result i64) (i32.const 1)
        (then 
          (if (result i64) (i32.const 1)
            (then (call $change_control))
            (else (i64.const 0))
          )
        )
        (else (i64.const 1))
      )
    )
  )
  "type mismatch"
)