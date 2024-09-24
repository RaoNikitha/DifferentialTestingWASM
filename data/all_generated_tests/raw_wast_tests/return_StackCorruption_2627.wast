;; 6. A test involving nested control structures (e.g., if-else blocks) with `return` instructions in different branches. The test should ensure that the stack integrity is maintained regardless of which branch is taken.

(assert_invalid
  (module
    (func $nested-control-structures (result i32)
      (i32.const 0)
      (if (result i32)
        (then (return (i32.const 1)))
        (else (return (i32.const 2)))
      )
    )
  )
  "type mismatch"
)