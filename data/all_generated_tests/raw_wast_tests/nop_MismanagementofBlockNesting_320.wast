;; 1. **Test 1**: Check a sequence of nested `block` instructions containing `nop` interspersed between operations, ensuring that `nop` does not alter the expected depth of block nesting on `br_table` exiting to the correct block.

(assert_invalid
  (module
    (func (block (block (nop) (br_table 0 1 2) (nop)) (br 0)) (nop) (nop)))
  "br_table target index out of range"
)