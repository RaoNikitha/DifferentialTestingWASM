;; 2. **Test Call with Incorrect Signature**:    Construct a module where a function is called with arguments that do not match its declared signature. This checks type consistency and whether the incorrect types lead to an `unreachable` state or a trap due to improper type checking by the call instruction.

(assert_invalid
  (module
    (func $incorrect-sig (param i32 f64) (result i32))
    (func $caller (param i32 f64) (result i32)
      (i32.const 1)
      (call $incorrect-sig (i32.const 10) (i32.const 20))
    )
  )
  "type mismatch"
)