;; 1. **Test Description**: A `block` instruction with a valid sequence of instructions, followed by an `unreachable` instruction. This tests whether `check_seq` in WebAssembly correctly validates the sequence up to and including the `unreachable` instruction, versus the `validateCode` switch-case pattern in wizard_engine. This ensures that neither implementation erroneously executes the unreachable code.

(assert_invalid
 (module
  (func
   (block (result i32)
    (i32.const 42)
    (unreachable)
    (i32.const 0)
   )
  )
 )
 "type mismatch"
)