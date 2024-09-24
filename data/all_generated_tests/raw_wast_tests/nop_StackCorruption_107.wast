;; 8. Implement a sequence of conditional branches (`br`, `br_if`) interspersed with `nop` instructions. Verify that the stack state after branching operations is consistent with the expected values and that `nop` does not disrupt the control flow.

(assert_valid
  (module
    (func $test_sequence
      (block $block1
        (nop)
        (br_if $block1 (i32.const 1))
        (nop)
        (br $block1)
      )
    )
  )
)