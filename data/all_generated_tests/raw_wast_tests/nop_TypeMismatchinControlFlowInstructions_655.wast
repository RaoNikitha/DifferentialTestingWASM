;; 6. Include a `nop` within a `call` instruction by having the `nop` followed by a call to another function that returns an `i32`. Verify if both implementations correctly handle and type check the stack around the `nop` and the `call`.

(assert_invalid
  (module (func $type-check 
    (nop) 
    (call $func-i32))
  (func $func-i32 (result i32) (i32.const 0)))
  "type mismatch"
)