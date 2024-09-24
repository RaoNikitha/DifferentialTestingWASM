;; 9. Create a nested function call scenario where each function either pushes values to or pops values from the stack. Introduce an `unreachable` instruction in one of the functions and ensure it leads to a trap without affecting the stack from other functions.

(assert_invalid
  (module
    (func $caller (call $callee) (i32.const 1))
    (func $callee (unreachable) (i32.const 2))
  )
  "type mismatch"
)