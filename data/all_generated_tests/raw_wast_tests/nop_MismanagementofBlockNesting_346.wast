;; 7. **Test Nop at Beginning and End of Block**: Create a function with a simple block that starts and ends with a `nop` instruction. This ensures the `nop` doesn't interfere with entering or exiting the block, maintaining proper control flow.

(assert_invalid
  (module
    (func $test (block (nop) (nop)))
  )
  "block structure error"
)