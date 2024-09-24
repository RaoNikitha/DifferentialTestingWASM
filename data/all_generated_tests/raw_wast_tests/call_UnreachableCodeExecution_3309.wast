;; 8. **Test Description**: Create a recursive function where the base case invokes an `unreachable` instruction if an index constraint is violated, ensuring bounds checking during the call.

(assert_invalid
  (module
    (func $test-recursive
      (param i32)
      (result i32)
      (local.get 0)
      (if (result i32)
        (i32.eqz)
        (then
          (unreachable)
        )
        (else
          (i32.const 1)
          (local.get 0)
          (i32.sub)
          (call $test-recursive)
        )
      )
    )
    (func
      (call $test-recursive (i32.const -1))
    )
  )
  "index out of bounds"
)