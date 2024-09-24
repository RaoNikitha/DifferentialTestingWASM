;; Create a block that defines a local variable and uses `br_table` to branch according to this local variable’s value. Situations where the variable’s value is at or near the boundary conditions (e.g., maximum index) will highlight differences in index boundary management between the two implementations.

(assert_invalid
  (module (func $br_table_boundary_test
    (block $outer_block
      (block $inner_block
        (local i32)
        (local.set 0 (i32.const 0))
        (br_table 0 1 (local.get 0))
      )
    end)
  ))
  "index out of bounds"
)