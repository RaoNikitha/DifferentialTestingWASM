;; 7. Create an `if` instruction with a `br_if` inside a loop, where the loop condition changes over iterations, alternating between true and false. Ensure correct loop execution based on changing conditions. This tests dynamic loop conditions influencing branching.

(assert_invalid
  (module
    (func $test-loop-branch (result i32)
      (local i32)
      (local.set 0 (i32.const 0))
      (loop (result i32)
        (if (result i32)
          (local.get 0)
          (then
            (i32.const 42)
            (br_if 0 (i32.const 1))
          )
          (else
            (local.set 0 (i32.add (local.get 0) (i32.const 1)))
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)