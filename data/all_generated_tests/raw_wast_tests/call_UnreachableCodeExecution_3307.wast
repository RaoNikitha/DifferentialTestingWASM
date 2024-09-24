;; 6. **Test Description**: Construct a function that misuses imported functions, leading to an `unreachable` instruction due to incorrect handling of global sequences, validating the reachability checks.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (global $glob (mut i32) (i32.const 10))
    (func $use-import (result i32)
      (call $external_func (global.get $glob))
      unreachable
    )
  )
  "unreachable code reached"
)