;; 7. **Test Description 7**: Construct a loop that has a sequence of multiple branches (`br`) each incrementing a counter with a final fallback to an `unreachable` instruction. Test if incorrect branch validation can inadvertently cause the fallback to be executed leading to `unreachable`.

(assert_invalid
  (module
    (func $complex-loop-branches
      (local $counter i32)
      (loop (result i32)
        (local.set $counter (i32.const 0))
        (br 0)
        (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
        (br 0)
        (unreachable)
      )
    )
  )
  "type mismatch"
)