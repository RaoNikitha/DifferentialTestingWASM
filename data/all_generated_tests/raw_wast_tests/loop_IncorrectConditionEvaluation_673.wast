;; 4. **Test Description 4**:    - **Test**: Loop where a `br_if` instruction's condition alternates between true and false across iterations.    - **Constraint**: Validate that the loop branches only on true evaluations.    - **Reason**: Broken condition handling might result in a failure to alternate correctly.

(assert_invalid
  (module
    (func $alternating-branch
      (local $counter i32)
      (i32.const 1)
      (local.set $counter)
      (loop (result i32)
        (local.get $counter)
        (if (result i32)
          (then
            (i32.const 0)
            (local.set $counter)
            (i32.const 1)
            (br_if 0)
          )
          (else
            (i32.const 1)
            (local.set $counter)
          )
        )
        (i32.const 0)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)