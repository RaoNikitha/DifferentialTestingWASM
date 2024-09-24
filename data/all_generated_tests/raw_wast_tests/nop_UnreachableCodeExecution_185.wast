;; 6. Test Description: Construct a switch-case structure where different cases start with a `nop`. Ensure that entering a case with an `unreachable` after `nop` results in proper trapping.

(assert_invalid
  (module
    (func $test-unreachable-in-case
      (block $B
        (i32.const 0)
        (br_table $B $B
          (nop)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)