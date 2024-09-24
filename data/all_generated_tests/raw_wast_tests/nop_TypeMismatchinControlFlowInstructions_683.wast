;; Test 4: Use `nop` immediately after a call instruction to a function returning `f32`, within a context expecting an `i32`. Check if the type mismatch due to context-insensitive `nop` placement is detected.

(assert_invalid
  (module
    (func $return_f32 (result f32)
      (f32.const 1.0))
    (func $type-mismatch (result i32)
      (call $return_f32)
      (nop)))
  "type mismatch"
)