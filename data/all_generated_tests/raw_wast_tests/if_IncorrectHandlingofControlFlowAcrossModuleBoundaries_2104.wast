;; A test where the `else` block of an `if` instruction calls an imported function, which in turn triggers another import leading to a chain of calls across multiple modules, especially validating consistent operand stack handling across these transitions.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i64)))
    (import "env" "nestedExternalFunc" (func $nestedExternalFunc (result i32)))
    (func (result i64)
      (if (result i64)
        (i32.const 0)
        (then (i64.const 1))
        (else (call $nestedExternalFunc) (call $externalFunc))
      )
    )
  )
  "type mismatch"
)