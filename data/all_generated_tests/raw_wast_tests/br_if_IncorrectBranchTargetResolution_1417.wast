;; 8. **Test Description**: Arrange two nested `if` statements followed by a `loop`, place a `br_if` inside the second `if` targeting the starting point of the `loop`. Examine if control incorrectly jumps out of the `if` statements and loop as intended.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.const 1)
        (then
          (if (i32.const 1)
            (then
              (loop
                (br_if 1 (i32.const 1)) 
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)