;; A test where an `if` instruction in a nested module calls another module's function inside the `then` block and relies on the control flow to pass values that determine behavior in the caller module post-return.

(assert_invalid
  (module
    (import "m" "fn" (func $fn (result i32)))
    (func (export "f") (result i32)
      (if (result i32)
        (i32.const 1)
        (then (call $fn) (drop) (i32.const 0))
        (else (i32.const 42))
      )
    )
  )
  "type mismatch"
)