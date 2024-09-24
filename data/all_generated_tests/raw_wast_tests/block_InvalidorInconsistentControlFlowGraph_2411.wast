;; Test 2: Structure a block to immediately branch out via a `br` instruction to test if the target stack state outside the block is correctly restored, ensuring proper CFG handling for branching.

(assert_invalid
  (module (func $br-operand-stack-restoration (result i32)
    (block (result i32) (i32.const 10) (br 0) (i32.const 20))
  ))
  "type mismatch"
)