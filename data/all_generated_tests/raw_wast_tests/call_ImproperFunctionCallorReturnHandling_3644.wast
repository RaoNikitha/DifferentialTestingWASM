;; 3. **Test Description**: Call a function with more return values than the caller expects, and check if the additional values are correctly handled.

(assert_invalid
  (module
    (func $callee (result i32 i32)
      (i32.const 1) (i32.const 2)
    )
    (func $caller (result i32)
      (call $callee)
    )
  )
  "type mismatch"
)