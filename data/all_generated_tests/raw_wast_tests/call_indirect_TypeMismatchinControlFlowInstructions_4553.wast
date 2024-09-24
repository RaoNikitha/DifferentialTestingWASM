;; 2. Create a module having a function `f2` that returns `i32`, but declare in the type section that it returns `f64`. Use `call_indirect` to call `f2` and observe if the type mismatch trap is triggered since the declared type does not match the actual function signature.

(assert_invalid
  (module
    (type $sig-f32 (func (result f64)))
    (func $f2 (result i32)
      (i32.const 42)
    )
    (table funcref (elem $f2))
    (func
      (call_indirect (type $sig-f32) (i32.const 0))
    )
  )
  "type mismatch"
)