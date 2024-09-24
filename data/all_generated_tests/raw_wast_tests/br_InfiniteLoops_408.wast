;; 9. Simulate an intentional repetitive loop with a `br` instruction that exits early based on operand stack conditions, confirming that stack unwinding and operand checks do not inadvertently make the loop permanent.

(assert_invalid
  (module
    (func $loop_with_early_exit
      (loop $outer_loop
        (block $break_block
          (br 1)
          (i32.const 0)
          (br_if $outer_loop (i32.eqz))
        )
      )
    )
  )
  "unknown label"
)