;; 8. **Test Description:**    Develop a series of nested blocks with `unreachable` inside an inner block and use `br_table` for exits from various depths, ensuring no instructions post `unreachable` are executed.    *Constraint Checked:* Accurate trap handling in nested blocks by `unreachable`.    *Mismanagement Focus:* Incorrect computation of block nesting leading to faulty `br_table` exit handling.

(assert_invalid
  (module
    (func $nested-unreachable-br_table
      (block 
        (block
          (block
            (unreachable) 
            (br_table 0 1 2 (i32.const 0))
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)