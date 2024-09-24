;; Test 3: Structure a loop that has an `unreachable` instruction at the end and an early `return` inside. The return should ensure the control flow breaks the loop correctly without encountering the `unreachable`.

(assert_invalid
  (module
    (func $return-inside-loop-unreachable
      (loop 
        (i32.const 0)
        (if (then (return)))
        unreachable
      )
    )
  )
  "unreachable executed"
)