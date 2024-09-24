;; 6. **`nop` within Conditional Branches**:    - Deploy `nop` instructions between conditional `br_if` branches inside loops and blocks. Check if the CFG properly associates the conditions with the correct paths.    - Constraint: Ensures conditional branches’ CFG correctly bypasses `nop` in branches.

(assert_invalid
  (module 
    (func $test
      block
        loop
          br_if 1 (i32.const 1)
          nop
          br 0
        end
      end
    )
  )
  "type mismatch"
)