;; 3. Develop a test that places alternating `nop` and `br_table` instructions within nested control structures such as `block` and `loop`. Check for correct handling and validation of the index and proper skip over `nop` during instruction execution.

(assert_invalid
  (module
    (func (block (loop (nop) (br_table 0 0 (i32.const 0)))))
  )
  "type mismatch"
)