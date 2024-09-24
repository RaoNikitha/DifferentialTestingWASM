;; 1. Create a function that contains an `unreachable` instruction followed by a `call` to another function. Test if the unreachable trap is raised before the call executes.

(assert_invalid 
  (module
    (func $unreachable_with_call
      unreachable
      call $foo
    )
    (func $foo)
  )
 "type mismatch"
)