;; 3. Call a function with mismatched argument types or counts that should trigger a trap. Validate that both implementations trap correctly and report the error.

(assert_invalid
  (module
    (func $mismatch-arg-types
      (call 0 (i32.const 0) (f32.const 1.5))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)