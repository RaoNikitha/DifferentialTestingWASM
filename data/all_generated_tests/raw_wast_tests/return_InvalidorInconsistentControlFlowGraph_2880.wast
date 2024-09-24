;; 9. **Implicit vs Explicit Return Types**:    - Define a function where the return type is implicitly determined by the context, and another with explicitly defined return types. This will test if the CFG can handle both implicit and explicit return type resolutions accurately.

(assert_invalid
  (module
    (func $implicit-vs-explicit (result i32)
      (return (i32.add (i32.const 1) (i32.const 2)))
    )
  )
  "type mismatch"
)