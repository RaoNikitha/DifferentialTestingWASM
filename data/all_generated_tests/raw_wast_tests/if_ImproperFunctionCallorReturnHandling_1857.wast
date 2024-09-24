;; 8. A case where the `if` instruction’s `then` block contains a `call` to a function that throws an exception, while the `else` block has a valid `return`. Testing if exceptions in function calls within control flow are uniformly handled across implementations.

(assert_invalid
  (module
    (func $throw_exception (throw 0))
    (func $valid_return (result i32) (i32.const 42))
    (func (result i32)
      (if (result i32)
        (i32.const 0)
        (then (call $throw_exception))
        (else (call $valid_return))
      )
    )
  )
  "unreachable"
)