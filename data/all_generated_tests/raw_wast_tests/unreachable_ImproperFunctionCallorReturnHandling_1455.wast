;; 6. Create a nested function call scenario where an `unreachable` is placed inside a nested function. Verify that the trap interrupts the nested call's return to the starting function.

(assert_invalid
  (module (func $nested-unreachable
    (call $inner)
    (return (i32.const 0))
  )
  (func $inner
    (unreachable)
  ))
  "type mismatch"
)