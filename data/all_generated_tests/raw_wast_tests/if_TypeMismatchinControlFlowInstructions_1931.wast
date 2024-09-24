;; 2. **Test for Type Mismatch in Result of Else Block**: Create a WebAssembly module with an `if` instruction where the `else` block produces an integer value (`i32`) while the `blocktype` anticipates a double value (`f64`). This checks the handling of mismatched result types between the blocks by different implementations.

(assert_invalid
  (module (func $type-mismatch-else-result (result f64)
    (if (result f64) (i32.const 1)
      (then (f64.const 1.0))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)