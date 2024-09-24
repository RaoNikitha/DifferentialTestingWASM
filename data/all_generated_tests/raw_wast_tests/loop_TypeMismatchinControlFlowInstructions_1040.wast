;; Test 1: A `loop` instruction that expects a result of type `i32` but contains instructions producing an `i64` result. This checks whether the type conflict is properly detected and enforced, leading to a type mismatch error when the loop is exited, as WebAssembly and Wizard Engine might handle stack types differently.

(assert_invalid
  (module (func $type-mismatch-loop (result i32)
    (loop (result i32) (i64.const 42))
  ))
  "type mismatch"
)