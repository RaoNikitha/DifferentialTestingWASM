;; Insert a `nop` instruction inside a block with both `call` and `return` instructions to verify that `nop` does not interfere with the block's entry conditions or exit mechanics, ensuring the block behaves as expected.

(assert_invalid
  (module
    (func $test (result i32)
      (block $B
        (nop)
        (call $someFunc)
        (return (i32.const 0))
      )
      (unreachable)
    )
    (func $someFunc)
  )
  "type mismatch"
)