;; 5. **Test `nop` Between Conditional Branch Checks**: Insert a `nop` between two `br_if` instructions, each depending on different stack conditions to branch correctly. The `nop` should not affect the branching logic for either condition.

(assert_invalid
  (module
    (func (block 
      (i32.const 1) 
      (br_if 0 (i32.const 0)) 
      (nop) 
      (br_if 0 (i32.const 1))
    ))
  )
  "type mismatch"
)