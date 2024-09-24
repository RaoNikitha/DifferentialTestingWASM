;; 3. **Test Call within a Loop with Incorrect Type**:    Create a loop that calls a function with wrong arguments, leading to a trap when loop control should instead reach an `unreachable` instruction. It tests the nested calls' validation and stack management.

(assert_invalid
  (module
    (func $loop-call-type-mismatch
      (loop
        (call 1 (i32.const 0))
        (unreachable)
      )
    )
    (func (param f64))
  )
  "type mismatch"
)