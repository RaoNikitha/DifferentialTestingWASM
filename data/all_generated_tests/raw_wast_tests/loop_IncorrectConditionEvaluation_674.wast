;; 5. **Test Description 5**:    - **Test**: Loop with a `br_if` instruction comparing a decrementing counter against zero.    - **Constraint**: Ensure the branch occurs only when the counter is zero.    - **Reason**: Misimplementation might trigger or ignore the branch at incorrect counter values.

(assert_invalid
  (module
    (func $loop_with_br_if
      (local $counter i32)
      (local.set $counter (i32.const 10))
      (loop
        (local.set $counter
          (i32.sub (local.get $counter) (i32.const 1))
        )
        (br_if 0
          (i32.eqz (local.get $counter))
        )
      )
    )
  )
  "type mismatch"
)