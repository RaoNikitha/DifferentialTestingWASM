;; 8. **Test Description**: A `block` terminating in an `unreachable` instruction immediately followed by another valid but unreachable `block`. This tests whether both implementations can correctly manage blocks and instructions following an `unreachable` without causing premature termination.

(assert_invalid
  (module (func
    (block (result i32)
      (unreachable)
    )
    (block (result i32)
     (i32.const 0)
    )
  ))
  "type mismatch"
)