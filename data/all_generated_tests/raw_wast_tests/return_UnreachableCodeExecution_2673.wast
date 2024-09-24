;; **Test 2**: Create nested blocks where the innermost block has a `return` followed by an `unreachable`. If the `return` is correctly implemented, the `unreachable` should never be executed. *Constraint Checking*: Ensures that block unwinding correctly returns from the function without executing subsequent code.

(assert_invalid
  (module
    (func $nested-blocks-return (result i32)
      (block
        (block
          (return)
          unreachable
        )
      )
    )
  )
  "unreachable code should not be executed"
)