;; 6. Create a function that simulates a countdown in a loop, with nested loops. Use a `br_if` in the outer loop to terminate the inner loop based on a condition, and place a `return` in the deepest nesting when the countdown finishes. Ensure the `return` instruction halts all loops correctly.

(assert_invalid
  (module
    (func $nested-loop-return (param $count i32) (result i32)
      (local $i i32)
      (block 
        (loop $outer
          (local.set $i (local.get $count))
          (loop $inner
            (local.set $i (i32.sub (local.get $i) (i32.const 1)))
            (br_if $inner (i32.gt_s (local.get $i) (i32.const 0)))
            (br_if $outer (i32.eq (local.get $i) (i32.const 0)))
          )
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)