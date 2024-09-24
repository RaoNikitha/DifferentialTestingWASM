;; 6. Construct a function that conditionally calls another function that contains an `unreachable` instruction. The focus is on whether or not the expected trap on function calls is fully consistent between the implementations.

(assert_invalid
  (module 
    (func $conditional-call (param i32)
      (if (local.get 0) 
        (then (call $unreachable-func))
      )
    )
    (func $unreachable-func (unreachable))
  )
  "unreachable reachable"
)