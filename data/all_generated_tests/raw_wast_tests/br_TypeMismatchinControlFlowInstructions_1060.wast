;; 1. **Test for Type Mismatch Exiting Block:**    Create a block that expects an `i32` result and use the `br` instruction within the block to branch to its end with an `i64` value on the stack. This tests whether the implementation correctly checks for type mismatches when exiting a block.

(assert_invalid
  (module
    (func $type-mismatch-exiting-block
      (block (result i32)
        (i64.const 42)
        (br 0)
      )
    )
  )
  "type mismatch"
)