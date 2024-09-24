;; Test 2:  Implement a loop with a `br_if` instruction that conditionally breaks the loop, and within the conditional, call a function indirectly via `call_indirect`. Ensure that if the function signature is not correctly matched, the loop continues indefinitely.

(assert_invalid
  (module
    (type $match (func (param i32) (result i32)))
    (type $mismatch (func (param i32)))
    (func $some_func (param i32) (result i32)
      (local.get 0)
    )
    (table funcref (elem $some_func))
    (func $test_loop
      (local i32)
      (loop
        (br_if 0
          (i32.const 1)
        )
        (call_indirect (type $mismatch) (local.get 0) (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)