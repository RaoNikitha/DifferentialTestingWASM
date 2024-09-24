;; 7. **Test Description:**    Craft a deeply nested structure of loops, with the `br` placed in the innermost loop to target the second outermost loop. The test should confirm that the branch instruction correctly jumps to the second outermost loop, thus ensuring the accuracy of label indexing in deeply nested loops.

(assert_invalid 
  (module 
    (func 
      (block (loop 
        (block (loop 
          (block (loop 
            (br 2))))))
  ))) 
  "unknown label"
)