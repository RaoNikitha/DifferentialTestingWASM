;; Test 4: Surround a loop with `nop` instructions, placing `unreachable` inside the loop body. Make sure iterating through the loop with `nop` instructions does not skip or alter the control flow towards the `unreachable`.

(assert_invalid
  (module
    (func (loop (nop) (unreachable) (nop)))
  )
  "unreachable code"
)