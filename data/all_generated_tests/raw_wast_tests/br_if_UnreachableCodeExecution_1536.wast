;; 7. **Test Description:** Create a `loop` containing multiple nested `block` instructions. Use `br_if` with various labels to manage conditional exit from these blocks back into the loop. Add an `unreachable` after the loop ending to ensure backward jumps don’t bypass correct loop termination.

(assert_invalid
  (module
    (func
      (loop $outer
        (block $blk1
          (block $blk2
            (br_if 1 (i32.const 1)) ; -> should cause a backward jump to $outer
            (br_if 0 (i32.const 0))
          )
        )
      )
      (unreachable)
    )
  )
  "type mismatch"
)