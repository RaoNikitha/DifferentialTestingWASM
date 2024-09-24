;; 9. **Test 9**: Insert `nop` before every `call` instruction in a function that chains several function calls. Validate that each function is correctly called in sequence and returns properly.

(assert_invalid
  (module
    (func $f1 (result i32) i32.const 42)
    (func $f2 (result i32) i32.const 0)
    (func $f3 (result i32)
      nop
      call $f1
      call $f2
    )
  )
  "type mismatch"
)