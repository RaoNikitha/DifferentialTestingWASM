;; 4. **Test Description:**    - An `if` statement contains an `unreachable`, followed by a `call`. If the `unreachable` is taken, verify that the `call` does not occur.    - **Constraint:** Checks control flow interruptions in conditional blocks.    - **Improper Function Call or Return Handling:** Confirms handling of call sequences is interrupted appropriately.

(assert_invalid
  (module
    (func $test
      (if (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (call $someFunction)
        )
      )
    )
    (func $someFunction (result i32) (i32.const 42))
  )
  "type mismatch"
)