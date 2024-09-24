;; **Test 5**: Include multiple `return` instructions within nested blocks with an `unreachable` instruction placed at the function's end. Any path scenario that erroneously executes the final `unreachable` indicates a failure. *Constraint Checking*: Confirms correct path termination within nested control structures.

(assert_invalid
  (module
    (func $nested_return_test
      (block
        (block
          (return)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)