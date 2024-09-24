;; 9. **Test for Mismatched Return Types from If Branches**: Craft a WebAssembly module with an `if` instruction where the `then` block returns a different type (e.g., `i32`) than the `else` block (e.g., `f32`). The test should reveal differences in type enforcement between the branches.

(assert_invalid
  (module
    (func
      (if (i32.const 0)
        (then (i32.const 1))
        (else (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)