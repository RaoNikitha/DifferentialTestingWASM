;; 7. A deeply nested structure with `block`, `loop`, and `if` constructs where `nop` instructions are inserted randomly throughout to test the integrity of the stack and control flow at multiple nested levels. Verify using trace statements that all paths traverse correctly.

(assert_invalid
 (module 
  (func $deeply_nested
   (block 
    (loop 
     (block 
      (if (i32.const 1)
       (then 
        (block
         (nop)
         (loop
          (nop)
          (block
           (if (i32.const 1)
            (then 
             (block
              (nop)
              (loop
               (nop))))))))))))))
  "type mismatch"
 )