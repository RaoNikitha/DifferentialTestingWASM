;; 9. **Test Description**: Have a loop that includes a function call in each iteration, which itself ends in a loop containing a `br_table` for multi-way branching. Verify if the correct branch is always taken and the return values align accordingly.    **Constraint Checked**: Multi-way branching accuracy in function calls within nested loops.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $nested (param i32) (result i32)
      (local i32)
      (block
        (loop (result i32)
          (br_table 0 0 0 (local.get 0))
        )
      )
    )
    (func $test
      (local i32)
      (loop
        (call $nested (i32.const 2))
        (drop)
      )
    )
  )
  "type mismatch"
)