;; 4. **br_table with NOP in Nested Structures**: Create a `br_table` that targets `nop` instructions within nested blocks and loops. Verify that the control flow jumps to the correct nested block level despite the presence of `nop`.

(assert_invalid
  (module
    (func (block (loop (block (br_table 0 0 0 (nop)))))))
  "type mismatch"
)