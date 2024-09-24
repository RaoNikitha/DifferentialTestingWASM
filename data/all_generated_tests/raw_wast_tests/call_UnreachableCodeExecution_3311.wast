;; 10. **Test Description**: Test with an exported function that triggers an `unreachable` instruction immediately due to mishandling of argument types, checking if the export validation propagates errors correctly.

(assert_invalid
  (module
    (func $trigger_unreachable
      (unreachable)
    )
    (export "testUnreachable" (func $trigger_unreachable))
  )
  "type mismatch"
)