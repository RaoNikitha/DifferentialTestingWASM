;; 10. Develop an `if` block that calls a function exporting the result to another module. Verify that the exported result is correctly calculated and propagated back irrespective of the `if` block's condition.

(assert_invalid
  (module
    (func $exportedFunc (export "exportedFunc") (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then (i32.const 25))
        (else (i32.const 50))
      )
    )
    (func $testFunc (result i32)
      (if (result i32) (i32.const 1)
        (then (call $exportedFunc (i32.const 0)))
        (else (call $exportedFunc (i32.const 0)))
      )
    )
  )
  "type mismatch"
)