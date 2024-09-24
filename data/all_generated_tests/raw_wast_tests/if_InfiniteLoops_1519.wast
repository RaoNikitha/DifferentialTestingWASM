;; 10. **Conditional Continue in a Simple Loop**: Create a test involving a simple counting loop where an `if` condition inside it determines whether to `br` to continue or exit the loop based on a counter. Verify stack and label management to prevent infinite looping.

(assert_invalid
  (module
    (func $conditional-loop (result i32)
      (local $counter i32)
      (local.set $counter (i32.const 10))
      (block (loop
        (local.get $counter)
        (i32.eqz)
        (if
          (then (br 1))
          (else
            (local.get $counter)
            (i32.const 1)
            (i32.sub)
            (local.set $counter)
            (br 0)
          )
        )
      ))
      (local.get $counter)
    )
  )
  "invalid result type in block"
)