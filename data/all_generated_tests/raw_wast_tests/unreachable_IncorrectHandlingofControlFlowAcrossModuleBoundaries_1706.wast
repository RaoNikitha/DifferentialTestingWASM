;; Test 7: Construct a sequence where an unreachable instruction follows a call to an imported function within a block and ensure consistent context reset behavior.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func (block (call $externalFunc) (unreachable) (i32.const 1)))
  )
  "type mismatch"
)