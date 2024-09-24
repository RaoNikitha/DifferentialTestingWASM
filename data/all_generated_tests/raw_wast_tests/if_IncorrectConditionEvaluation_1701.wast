;; 2. Test an `if` instruction with a non-zero (true) condition that skips the `else` block in `WebAssembly Validator`, but the `Wizard Engine` jumps to `else` due to incorrect operand state.

(assert_invalid
  (module
    (func $type-skip-else
      (if (i32.const 1) (then (i32.const 42)) (else (i32.const 24)) (drop))
    )
  )
  "type mismatch"
)