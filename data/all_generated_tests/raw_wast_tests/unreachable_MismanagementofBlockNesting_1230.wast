;; 1. **Test Description:** Nested blocks with mixed instructions where an `unreachable` instruction is placed within the innermost block. The differential test checks if the stack validation properly accounts for the `unreachable` being reachable only within the innermost block and not disrupting outer blocks.        **Constraint Checked:** Correct validation of stack polymorphism within nested blocks.

(assert_invalid
  (module (func $unreachable_in_nested_blocks (result i32)
    (block (result i32)
      (block (result i32)
        (unreachable)
        (i32.const 1)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)