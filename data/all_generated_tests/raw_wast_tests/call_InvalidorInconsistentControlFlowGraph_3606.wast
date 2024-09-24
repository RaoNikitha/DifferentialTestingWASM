;; 5. **Test Nested Calls with Incorrect Depth Handling**:    - **Description**: Create nested `call x` instructions where the nesting exceeds the call stack's maximum depth.    - **Constraint**: Validate the handling of call stack depth limits.    - **Relation to CFG**: Incorrect control flow handling can result in exceeding the stack depth without proper trapping.

(assert_invalid
  (module
    (func $f (result i32)
      (i32.const 42)
    )
    (func $nested-calls
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
      (call $f)
    )
  )
  "call stack overflow"
)