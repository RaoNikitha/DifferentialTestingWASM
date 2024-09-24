;; Test 8: Place `unreachable` at the end of a sequence of stack popping operations (e.g., constants or local.get operations) to see if a stack mismatch is correctly identified.

(assert_invalid
  (module (func $type-unreachable-end-stack-mismatch
    (i32.const 42) (unreachable) (i32.const 0)
  ))
  "type mismatch"
)