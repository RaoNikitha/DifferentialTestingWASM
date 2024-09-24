;; 2. Write a sequence where `unreachable` follows an `i64.const` instruction and is nested inside a `block`. Ensure that the stack state is consistent and the block structure is properly interrupted by the unreachable instruction.

(assert_invalid
  (module (func $test-unreachable-after-i64-const-in-block
    (block (i64.const 0) (unreachable) (i32.const 1))
  ))
  "type mismatch"
)