;; 4. Design a test with a loop that has a complex condition; place `unreachable` in the `else` part of an `if` condition within the loop. Ensure the loop traps when the `else` branch is taken.

(assert_invalid
  (module
    (func $complex-loop-unreachable
      (loop
        (i32.const 0)
        (if
          (i32.const 1)
          (then)
          (else (unreachable))
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)