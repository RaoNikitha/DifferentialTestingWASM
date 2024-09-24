;; 6. **Test 6**: Position `nop` inside nested control structures (like multiple nested `block` and `loop` ) and verify the correct execution of `br` instructions that exit from these nested blocks, ensuring that `nop` does not interfere with the nesting levels.

(assert_invalid (module (func (block (loop (nop) (br 1))))) "type mismatch")