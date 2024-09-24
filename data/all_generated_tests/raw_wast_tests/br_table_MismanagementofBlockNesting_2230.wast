;; 10. Test the implementation of `br_table` within a function containing a sequence of nested loops with varying operand values, checking if the implementation misinterprets the depth and exits the correct loop.

(assert_invalid
  (module 
    (func $nested-loops 
      (loop 
        (block 
          (loop 
            (block 
              (br_table 0 1 2 (i32.const 3))
            ) 
          ) 
        ) 
      ) 
    )
  )
  "unknown label"
)