;; 10. Develop a differential test with an outer `if` instruction leading into an inner branch that has an `unreachable` instruction. Confirm that any invalid jumps or incorrect stack states trigger the trap at the `unreachable`.

(assert_invalid
  (module
    (func $test
      (if (result i32)
        (i32.const 1)
        (then
          (if (i32.const 1) (then (unreachable)))
        )
        (else (i32.const 0))
      )
      (drop)
    )
  )
  "unreachable"
)