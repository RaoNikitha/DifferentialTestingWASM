;; 6. **Test Description:**    Design a sequence of nested blocks, with an `unreachable` call in an intermediate block while having `br_table` using indices to target exits from the nested structure at various depths correctly.    *Constraint Checked:* Validation of nested block trap exits with `unreachable`.    *Mismanagement Focus:* Miscalculation of block nesting depth affecting `br_table` behavior due to `unreachable`.

(assert_invalid
  (module
    (func $nested-block-unreachable-br_table
      (block
        (block
          (block
            (unreachable)
            (br_table 0 1 2 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)