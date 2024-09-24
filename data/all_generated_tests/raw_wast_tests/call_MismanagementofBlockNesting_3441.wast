;; 10. **Test 10**: Create nested conditional branches each invoking a `call` to a function with no arguments but multiple return values. Focus on verifying if nested conditions correctly manage the return value types on the stack post-function call within different WebAssembly engines.

(assert_invalid
  (module
    (type (func (result i32 i32)))
    (func $nested-conditions
      (if (i32.const 1)
        (then
          (call 0)
          (if (i32.const 1)
            (then
              (call 0)
            )
          )
        )
      )
    )
    (func (result i32 i32) (i32.const 1) (i32.const 2))
  )
  "type mismatch"
)