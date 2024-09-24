;; 3. **Test Description 3:** Inside an `if` branch, include an `unreachable` instruction immediately followed by an `i32` producing instruction in the else part. This tests whether the type enforcement correctly acknowledges that unreachable breaks the type constraints expected from the if branch result type.

(assert_invalid
  (module (func (result i32)
    (if (i32.const 1)
      (then (unreachable))
      (else (i32.const 10))
    )
  ))
  "type mismatch"
)