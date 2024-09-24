;; 6. **Test for Forward Branch Type Mismatch**: Test a WebAssembly module where a branch instruction inside the `then` block jumps to an `end` instruction that expects a different type on the operand stack compared to what is provided. This helps identify how forward type mismatches are validated.

(assert_invalid
  (module (func $forward-branch-type-mismatch (result i32)
    (if (result i32)
      (i32.const 1)
      (then (br 0 (i64.const 1)))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)