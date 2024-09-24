;; 9. **Test Call to a Function with an Unresolved Import**:    Create a module which attempts to call a function that is an unresolved import, verifying if the engine properly traps or continues executing to an `unreachable` instruction due to unresolved external dependencies.

(assert_invalid
  (module
    (func $call-unresolved-import (call 0))
    (import "env" "unresolved_func" (func))
  )
  "unknown function"
)