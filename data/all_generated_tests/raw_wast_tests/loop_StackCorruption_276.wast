;; 7. Write a `loop` that processes multiple stack values, including nested loops modifying different stack sections. Check that each section of the stack is consistent and no overlapping writes occur.

(assert_invalid
 (module
  (func $nested-loop-stack
   (i32.const 1) 
   (i32.const 2)
   (loop 
    (i32.add)
    (loop
     (i32.const 3)
     (i32.add)
     (br 1) 
    )
    (i32.add)
   )
   (drop)
  )
 )
 "type mismatch"
)