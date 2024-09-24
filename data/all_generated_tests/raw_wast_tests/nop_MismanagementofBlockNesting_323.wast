;; 4. **Test 4**: Place `nop` instructions within a series of nested `block` and `loop` structures that contain additional `br_table` instructions. Confirm that exiting `br_table` targets the appropriate block or loop, not affected by `nop`.

(assert_invalid
  (module
    (func (block (loop (nop) (block (loop (br_table 1 0 0) (nop)) (nop))) (nop)))
  )
  "unknown label"
)