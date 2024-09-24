;; 9. Create test inputs where `br_table` indices are dynamically calculated to be intermittently valid and invalid, ensuring the encapsulating `nop` instructions do not alter functionality. Validate behavior consistency in both environments.

(assert_invalid
  (module 
    (func (block (br_table 0 1 2 (i32.const 3)) (nop)))
  )
  "br_table index out of range"
)