;; 9. Evaluate an `unreachable` instruction inside a conditional branch within an imported function that's called by another module. Validate that the trap correctly reflects in the control flow of the calling module.

(assert_invalid
  (module
    (import "env" "test" (func $test))
    (func (call $test) (unreachable) (i32.const 1))
  )
  "unexpected end of section or function"
)