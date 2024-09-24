;; Test 8: Implement `nop` before and after `unreachable` to confirm that `nop` doesn't interact with the stack in any way that causes unexpected behavior following an `unreachable`.

(assert_invalid
  (module
    (func (unreachable) (nop))
  )
  "no validation error expected"
)