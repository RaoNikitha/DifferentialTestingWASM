;; 8. Craft an executable with a `br_table` whose largest index points to an `unreachable`. This evaluates if the highest boundary handling of `br_table` properly identifies and correctly forwards to the `unreachable` causing a trap.

(assert_invalid
  (module
    (func
      (block (br_table 0 1 2 3 (unreachable)))
      (i32.const 4)
      (block (unreachable))
    )
  )
  "target index out of range"
)