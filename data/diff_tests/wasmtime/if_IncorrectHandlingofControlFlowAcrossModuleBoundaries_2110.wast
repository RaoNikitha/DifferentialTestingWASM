;; 1. **Test Description:**    Call an imported function within the `then` block of an `if` statement and place an `unreachable` instruction immediately after the call. Verify if the `unreachable` trap is correctly triggered if the condition is true.

(assert_invalid
  (module (import "env" "externalFunc" (func $externalFunc (param i32) (result i32)))
    (func (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then
          (call $externalFunc (i32.const 42))
          (unreachable)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "unreachable reached"
)