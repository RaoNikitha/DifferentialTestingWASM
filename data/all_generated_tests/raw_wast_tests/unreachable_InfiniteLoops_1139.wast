;; Design a loop where an `unreachable` instruction is enclosed within multiple layers of conditional branches and loop structures to see if improper handling leads to the loop ignoring `unreachable`, causing it to run infinitely.

(assert_invalid
  (module
    (func $nested-conditions-loop
      (loop (if (i32.const 1)
          (block 
            (if (i32.const 0)
              (block 
                (unreachable)
              )
              (loop
                (br 0)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)