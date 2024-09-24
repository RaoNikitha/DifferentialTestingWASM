;; 9. **Test Description:**    Nested blocks with loops, where inner loops incorrectly restore stack state after `br`, causing an infinite outer loop.      **Constraint Checked:** Accurate stack restoration on branching within nested loops.      **Relation to Infinite Loops:** Ensures that branching affects the stack appropriately to prevent infinite outer loop execution.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (loop
          (i32.const 0)
          (br 1)
          (block (result i32)
            (loop (block (result i32)
              (br 3)
            ))
          )
          (drop)
        )
      )
    )
  )
  "type mismatch"
)