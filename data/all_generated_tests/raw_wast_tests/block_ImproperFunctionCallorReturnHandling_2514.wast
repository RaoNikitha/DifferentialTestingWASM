;; Create a block that uses a `call` instruction to invoke a function dependent on global state changes (like global variables altered before the call), to check how the implementations propagate state-related changes through the operand stack during and after the call.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $alter_global (result i32)
      global.get $g
      i32.const 1
      i32.add
      global.set $g
      global.get $g)
    (func $test_block (result i32)
      (block (result i32)
        call $alter_global
        (block (result i32)
          (global.set $g (i32.const 2))
          (call $alter_global))
        call $alter_global)))
  "type mismatch"
)