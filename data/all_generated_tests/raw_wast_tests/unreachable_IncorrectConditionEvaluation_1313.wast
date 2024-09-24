;; Design a function that performs a series of numeric and relational operations, using the result of these operations as a condition. Insert an `unreachable` instruction in a branch that should be unreachable. Verify if wrong condition evaluation triggers the trap unexpectedly.

(assert_invalid
  (module (func (result i32)
    (if (i32.eq (i32.const 1) (i32.add (i32.const 0) (i32.const 1)))
      (then (unreachable))
    )
    (i32.const 0)
  ))
  "unreachable should not be hit"
)