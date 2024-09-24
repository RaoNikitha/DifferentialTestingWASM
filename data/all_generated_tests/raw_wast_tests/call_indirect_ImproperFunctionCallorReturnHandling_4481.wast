;; 10. Create a WASM test case where `call_indirect` instruction intends to call a function with a mismatched function signature (e.g., expected `i32` but provides `i64`). Ensure that OCaml implementation traps due to pattern matching failure and Java encounters type mismatch error during `checkSignature` execution.

(assert_invalid
  (module
    (func $f (param i64))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $mismatched_signature
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)