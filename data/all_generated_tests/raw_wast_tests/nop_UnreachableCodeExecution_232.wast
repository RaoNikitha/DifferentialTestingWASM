;; 3. Embed a `nop` within a loop structure where the loop contains an `unreachable` statement. Confirm that the loop correctly handles `nop` and only traps upon encountering `unreachable`.

(assert_invalid
  (module
    (func (loop (nop) (unreachable)))
  )
)