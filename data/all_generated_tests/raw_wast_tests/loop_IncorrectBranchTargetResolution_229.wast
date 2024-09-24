;; 10. **Test for Incorrect Branch Targets in Mixed Control Structures**:     Combine loops with other control structures like `if` and `block`, where branches inside loops should correctly resolve to their respective loop targets, not the surrounding control structures. This verifies the correct resolution in mixed contexts.

(assert_invalid
  (module
    (func $mixed-control-structures
      (block
        (loop $l1 (br_if 1 (i32.const 1)))  ;; Branch should target the block, not the loop
      )
      (loop $l2 (br_if 2 (i32.const 1)))  ;; Incorrect branch target, should be invalid
    )
  )
  "invalid branch target"
)