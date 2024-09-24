;; Test 5: Interleave `unreachable` between nested control structures, such as placing it inside blocks within a loop to ensure nested CFG paths are invalid upon hitting the trap.

(assert_invalid
  (module
    (func $nested-control-structures
      (block
        (loop
          (block
            (unreachable)
          )
        )
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)