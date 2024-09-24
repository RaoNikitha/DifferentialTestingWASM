;; 9. Develop a multi-function WASM module where functions call each other and eventually return. Ensure that each function's `return` instruction correctly manages the operand stack, avoiding any cross-function stack corruption or improper stack handling on return.

(assert_invalid
  (module
    (func $foo (result i32)
      (i32.const 10)
      (call $bar)
    )
    (func $bar (result i32)
      (i32.const 20)
      (return)
    )
  )
  "type mismatch"
)