;; 5. Implement a sequence where `else` in an `if-else` construct improperly branches to an `unreachable`. This checks the compliance with the expected behavior when false conditions evaluate the `else` leading to `unreachable`.

(assert_invalid
  (module (func $type-if-else-unreachable
    (if (result i32)
      (i32.const 1)
      (then (i32.const 42))
      (else (unreachable))
    )
  ))
  "type mismatch"
)