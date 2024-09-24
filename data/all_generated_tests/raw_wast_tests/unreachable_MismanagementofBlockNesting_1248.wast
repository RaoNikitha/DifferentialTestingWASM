;; 9. Create a setup where an `unreachable` is in a deep nested loop and `if` scenario, followed by `br_table` targeting points outside the loops and blocks. Tests correct depth handling by `br_table` after `unreachable` within such complex nestings.

(assert_invalid
  (module (func $test-unreachable-nested-if-loop-br_table
    (block
      (loop
        (if (i32.const 1)
          (then
            (loop
              (unreachable)
              (br_table 0 1 2 (i32.const 0))
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)