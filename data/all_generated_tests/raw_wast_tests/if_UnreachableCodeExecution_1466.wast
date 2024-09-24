;; 7. Design a test using a loop encapsulating an `if` instruction with an `unreachable` in its `else` block. Confirm that the loop termination adheres to stack state integrity and traps if unintended paths are taken.

(assert_invalid
  (module
    (func $loop-if-unreachable
      (loop $L
        (i32.const 0)
        (if (then (br $L)) (else (unreachable)))
      )
    )
  )
  "unreachable"
)