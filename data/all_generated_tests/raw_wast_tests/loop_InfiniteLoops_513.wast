;; 4. Construct a `loop` with an invalid stack unwinding operation before a `br` instruction. Test if `WebAssembly` raises an error via `require` method, whereas `wizard_engine` mishandles and causes an infinite loop due to incorrect stack handling.

(assert_invalid
  (module (func $invalid-stack-unwind (result i32)
    (loop (result i32) (i32.const 1) br 0)
  ))
  "type mismatch"
)