;; 1. **Test Description:**    Call an imported function within the `then` block of an `if` statement and place an `unreachable` instruction immediately after the call. Verify if the `unreachable` trap is correctly triggered if the condition is true.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_fn (if (result i32) (i32.const 1)
      (then
        (call $external_func)
        (unreachable)
      )
    ))
  )
  "unreachable"
)