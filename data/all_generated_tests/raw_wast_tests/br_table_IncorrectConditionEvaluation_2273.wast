;; Test 3: Create a nested structure of blocks and loops, and execute `br_table` with an operand index that should branch to an outer block. Ensure the branch occurs correctly and does not confuse the depth of the target label.

(assert_invalid
  (module
    (func 
      (block
        (loop
          (block $outer
            (block $inner
              (br_table 1 0 (i32.const 2))
            )
          )
        )
      )
    )
  )
  "unknown label"
)