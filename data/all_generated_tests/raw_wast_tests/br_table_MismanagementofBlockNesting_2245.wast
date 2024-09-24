;; 5. **Nested Loops with Boundary Checking:**    - Place `br_table` within nested loops and ensure that outermost loop exits upon invalid operand indices.    - Confirms that deeply nested structures are correctly interpreted and out-of-bound checks redirect to the appropriate default target.

(assert_invalid
  (module 
    (func 
      (loop 
        (block 
          (loop 
            (block 
              (br_table 0 0 (i32.const 3)) 
            ) 
          ) 
          (i32.const 0)
        )
      ) 
    ) 
  )
  "unknown label"
)