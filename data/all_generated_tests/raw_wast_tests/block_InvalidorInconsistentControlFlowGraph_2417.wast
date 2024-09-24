;; Test 8: Use a block that includes an `unreachable` instruction followed by other instructions, checking if the CFG correctly short-circuits execution paths following unreachable code.

(assert_invalid
  (module (func $block-with-unreachable
    (block (result i32) (unreachable) (i32.const 42))
  ))
  "type mismatch"
)