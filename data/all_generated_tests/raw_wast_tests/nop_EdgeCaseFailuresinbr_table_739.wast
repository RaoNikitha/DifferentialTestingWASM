;; 10. Have `br_table` point to a function end, with `nop` instructions placed before and after `br_table` and at function boundaries. This will analyze if `nop` impacts `br_table`’s ability to correctly branch to the function’s termination point.

(assert_invalid
  (module
    (func (result i32)
      nop
      block
        br_table 0 0
        nop
        br 0
      end
      nop
    )
  )
  "type mismatch"
)