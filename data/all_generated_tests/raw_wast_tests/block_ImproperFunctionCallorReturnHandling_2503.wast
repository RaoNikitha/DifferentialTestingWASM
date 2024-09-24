;; 4. Test Description: Generate a scenario where a block with a `call` instruction is followed by an immediate return (`return` instruction) before the called function has a chance to act. WebAssembly should maintain stack integrity through `check_block`, while `wizard_engine` might incorrectly manage the stack upon an immediate return.

(assert_invalid
  (module
    (func $type-call-return-mismatch
      (block (result i32) (call $some_function) (return))
    )
    (func $some_function (result i32)
      i32.const 42
    )
  )
  "type mismatch"
)