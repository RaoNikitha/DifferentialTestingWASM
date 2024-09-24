;; 8. **Infinite Loop Detection with Nops and Nested Branches**: Insert `nops` in a structure of nested loops and branches such that an incorrect branch target could result in an infinite loop. This ensures that `nop` does not cause branches to loop incorrectly.

(assert_invalid
  (module 
    (func $nested-loops (loop $outer (block (br $outer) (loop $inner (nop) (br $outer)))))
  )
  "infinite loop detection"
)