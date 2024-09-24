;; 1. **Unreachable Code Detection Test:**    Create a function with a nested block structure where a `br` instruction jumps out of the innermost block to a middle block, followed by code which should be marked as unreachable. This tests if the implementation correctly identifies and skips the unreachable code.

(assert_invalid
  (module
    (func $unreachable-code-detection-test
      (block
        (block
          (br 0)
          (unreachable)
        )
        (i32.const 0)
        (unreachable)
      )
    )
  )
  "type mismatch"
)