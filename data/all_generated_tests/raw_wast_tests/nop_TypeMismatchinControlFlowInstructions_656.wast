;; 7. Write a `try`-`catch` block where the `try` block has a `nop` instruction followed by an `i64.const` and an `i64.shl` operation. Ensure the `catch` block processes a type-compatible exception. This test checks control flow integrity during exception handling.

(assert_invalid
 (module
  (func (try (result i64) (nop) (i64.const 42) (i64.shl) (catch_all)))
  "type mismatch")
)