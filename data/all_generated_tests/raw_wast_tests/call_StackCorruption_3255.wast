;; **Test 4**: Invoke a function that calls itself recursively. - **Constraint Checked**: Maintenance of call stack depth. - **Stack Corruption Risk**: Recursive calls might not correctly push/pop frames in wizard_engine, leading to stack overflow or underflow.

(assert_invalid
  (module
    (func $recursive (result i32)
      (call $recursive)
      (i32.const 0)
    )
    (export "main" (func $recursive))
  )
  "stack overflow"
)