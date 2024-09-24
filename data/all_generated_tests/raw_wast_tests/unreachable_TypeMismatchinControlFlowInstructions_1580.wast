;; 1. **Test Description 1:** A test with an `unreachable` instruction nested inside a `block` that expects an `i32` value, followed by an `i32.const` outside the block to produce the type enforcement. This test checks whether the implementation correctly catches that the block's pop instruction will never be reached due to the trap.

(assert_invalid
  (module (func $type-block-with-unreachable (result i32)
    (block (result i32)
      (unreachable)
    )
    (i32.const 0)
  ))
  "type mismatch"
)