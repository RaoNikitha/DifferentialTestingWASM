;; Test a `loop` block with a complex `br_table` having multiple nested loops where indices create a branching pattern that tests the boundaries of all possible labels involved, ensuring consistency in both implementations.

(assert_invalid
  (module
    (func $nested-loop-br-table
      (block $outer_block
        (i32.const 0)
        (loop $outer_loop 
          (block $inner_block
            (loop $inner_loop 
              (block $deep_block
                (loop $deep_loop 
                  (br_table $outer_loop $inner_loop $deep_loop $outer_block $inner_block $deep_block (i32.const 3))
                )
              )
              (drop)
            )
          )
          (drop)
        )
      )
    )
  )
  "type mismatch"
)