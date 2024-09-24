;; - **Test 5**: Create a scenario with function calls within both `then` and `else` blocks, where the condition results in switching between function outputs. Ensure the operand stack's height and type are correctly managed.

(assert_invalid
  (module
    (func $dummyFunc (param i32) (result i32)
      (i32.const 42)
    )
    (func $testFunc
      (local i32)
      (i32.const 1)
      (if (result i32)
        (then (call $dummyFunc (i32.const 0)))
        (else (call $dummyFunc (i32.const 1)))
      )
    )
  )
  "type mismatch"
)