;; 9. **Test Description:** Build nested `if` and `loop` structures, where `br_if` facilitates conditional jumps. Insert `unreachable` instructions at critical points like after the `loop` constructs to ensure that labels are correctly interpreted, maintaining valid program flow without unexpected terminations.

(assert_invalid
  (module 
    (func $nested-structures
      (block
        (if (i32.const 1)
          (then
            (loop (br_if 0 (i32.const 1)) unreachable)
          )
        )
      )
    )
  )
  "unreachable executed"
)