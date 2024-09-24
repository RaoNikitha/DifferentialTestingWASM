;; 10. **Loop with Mixed Levels of Operand Consumption and Production**:     Implement nested loops where the inner loop produces more operands than the outer loop consumes, and verify correctness of operand stack unwinding and management during branching. This scenario tests whether the implementation can handle mismatched operand levels across nested loops, ensuring branches respect stack depth and validity requirements.

(assert_invalid 
 (module 
  (func $nested-loop-mixed-operand 
   (i32.const 1) 
   (loop (param i32) 
    (i32.const 2) 
    (loop (param i32) 
     (i32.const 3) 
     (drop) 
     (br 0) 
    ) 
    (drop) 
    (br 0) 
   ) 
   (drop)
  )
 )
 "type mismatch"
)