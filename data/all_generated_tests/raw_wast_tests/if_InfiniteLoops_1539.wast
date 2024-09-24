;; 10. A test with the `if` instruction having a sequence of the `else` block containing nested loops, each with its own breaking condition. This checks whether the internal labels maintain correct exit conditions without overlapping, preventing infinite loops.

(assert_invalid
  (module
    (func $nested-loops-else-block (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then
          (i32.const 1)
        )
        (else
          (loop (result i32)
            (if (result i32) (local.get 0)
              (then (br 1 (i32.const 2)))
              (else (i32.const 3))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)