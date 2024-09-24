;; 3. **Test Description**: Design a block with a sequence of push operations that fill the stack, followed by an `unreachable` instruction. A subsequent `drop` operation after the block should not reach the `unreachable` instruction if the block's stack operations are handled correctly.

(assert_invalid
  (module (func $test
    (block (result i32) (i32.const 42) (unreachable))
    (drop)
  ))
  "unreachable executed"
)