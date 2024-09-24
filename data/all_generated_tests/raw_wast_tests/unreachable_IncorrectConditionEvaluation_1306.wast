;; 7. Structure a function with `unreachable` within an `if` condition followed by multiple `br_if` checks for specific conditions. Verify that `unreachable` traps immediately if reached, and that `br_if` checks are evaluated correctly in all paths.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (br_if 0 (i32.const 0))
        )
      )
      (br_if 1 (i32.const 1))
    )
  )
  "type mismatch"
)