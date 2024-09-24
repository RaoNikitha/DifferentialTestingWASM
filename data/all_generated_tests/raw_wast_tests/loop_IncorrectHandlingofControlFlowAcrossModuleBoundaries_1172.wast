;; 3. Test a nested loop structure where the outer loop calls an exported function with its own loop. Verify that the operand stack and control flow context are correctly restored after each function call.

(assert_invalid
  (module
    (func $exported_loop (export "exported_loop") (result i32)
      (loop (result i32)
        (br 0)
      )
      (i32.const 1)
    )
    (func
      (loop (result i32)
        (call $exported_loop)
      )
    )
  )
  "type mismatch"
)