;; Create an interdependent loop structure where an improperly handled stack unwinding in one loop could lead to an `unreachable` instruction in another loop. Test that stack unwinding operates correctly to avoid executing `unreachable`.

(assert_invalid
  (module
    (func $test
      (loop (param i32) 
        (br 1)
      )
      (loop (result i32)
        (unreachable)
      )
    )
  )
  "type mismatch"
)