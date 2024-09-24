;; 8. Write a function that performs a comparison operation immediately after a `nop` and uses the result for a `br_if` condition. Ensure the comparison result leads to consistent branching behavior in both engines.

(assert_invalid
  (module 
    (func (block (nop) (i32.const 0) (i32.const 1) (i32.eq) (br_if 0)))
  )
  "type mismatch"
)