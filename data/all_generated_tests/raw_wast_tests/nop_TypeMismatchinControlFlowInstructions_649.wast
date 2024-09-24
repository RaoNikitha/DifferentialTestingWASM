;; 10. A test where a `loop` includes `nop`, followed by a `return` operation that tries to return a value, causing a stack type mismatch due to `nop` not affecting the stack.

(assert_invalid
  (module (func $type-loop-return (result i32)
    (loop (nop) (return (i32.const 42)))
  ))
  "type mismatch"
)