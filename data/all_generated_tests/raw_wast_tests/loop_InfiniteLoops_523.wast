;; - Test 4: Craft a loop with an incorrect block type in `Wizard Engine`, causing it to never match the result type and infinitely loop while `WebAssembly` correctly raises a type error.

(assert_invalid
  (module (func $incorrect-block-type-loop
    (i32.const 0) (loop (param i32 f32) (result f32) (drop) (drop))
  ))
  "type mismatch"
)