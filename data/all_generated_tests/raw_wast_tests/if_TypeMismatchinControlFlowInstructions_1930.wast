;; 1. **Test for Type Mismatch in Result of Then Block**: Construct a WebAssembly module with an `if` instruction where the `then` block produces an integer value (`i32`) but the `blocktype` is defined to expect a floating-point value (`f32`). This should highlight differences in type checking enforcement.

(assert_invalid
  (module (func $type-mismatch-then-result (result f32)
    (if (result f32) (i32.const 1)
      (then (i32.const 1))
      (else (f32.const 1.0))
    )
  ))
  "type mismatch"
)