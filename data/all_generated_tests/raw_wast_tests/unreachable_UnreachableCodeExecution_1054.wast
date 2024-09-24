;; 5. Construct a sequence of instructions where `call` to another function includes an `unreachable` instruction, and verify that once the called function reaches the `unreachable`, the main function traps.

(assert_invalid
 (module 
  (func $foo (unreachable))
  (func $bar (call $foo) (i32.const 1))
 )
 "type mismatch"
)