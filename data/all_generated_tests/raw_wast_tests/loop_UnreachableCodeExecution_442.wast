;; Develop a loop with multiple branches, where one branch conditionally should never be taken and leads to an `unreachable` instruction. Confirm that under these conditions the `unreachable` is not executed.

(assert_invalid
  (module 
    (func 
      (loop (result i32)
        (i32.const 0)
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "type mismatch"
)