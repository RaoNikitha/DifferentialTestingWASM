;; 2. **Test Description:**    Create a loop in the main module that calls an imported function containing an `unreachable` instruction. Verify that the loop only executes once and traps immediately, ensuring no continuation in both implementations.

(assert_invalid
  (module
    (import "env" "unreachable_func" (func $unreachable_func))
    (func (result i32)
      (loop
        call $unreachable_func
      )
    )
  )
  "unreachable"
)