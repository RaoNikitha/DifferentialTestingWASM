;; 3. **Mixed Block and Loop Structures**: Design a function with alternating nested loops and blocks, with a `return` call in the deepest nested structure. The test validates that `return` jumps to the outermost block, ensuring intermediate blocks and loops do not interfere.

(assert_invalid 
 (module 
  (func $test
   (block
    (loop
     (block 
      (loop 
       (return (i32.const 1))
      )
     )
    )
   )
  ) 
 "type mismatch"
)
