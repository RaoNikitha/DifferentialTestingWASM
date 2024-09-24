;; 5. **Test Description:** Place `unreachable` in a nested `block` inside a loop, and use multiple nested `br` instructions to jump out of these control structures.    - **Constraint Checked:** Validates nesting of blocks and loops with `unreachable` and the accuracy of nested branch target resolution.    - **Incorrect Branch Target Relation:** Tests the proper branching out of nested structures, verifying if it correctly skips or hits `unreachable` as intended.

(assert_invalid
  (module 
    (func $test (result i32)
      (loop (result i32)
        (block (result i32)
          (block (result i32)
            (unreachable)
            (br 1 (i32.const 0))
          )
          (br 0 (i32.const 1))
        )
      )
      (i32.const 2)
    )
  )
  "type mismatch"
)