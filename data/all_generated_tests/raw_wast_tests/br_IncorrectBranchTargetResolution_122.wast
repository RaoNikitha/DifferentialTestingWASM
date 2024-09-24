;; Design a test with a `loop` inside a `block` and insert a `br` instruction targeting the `loop` (`br 0`) from within the block. Verify that the branch correctly jumps to the beginning of the loop, not elsewhere.

(assert_invalid
  (module
    (func $test (block (loop (br 0))))
  )
  "type mismatch"
)