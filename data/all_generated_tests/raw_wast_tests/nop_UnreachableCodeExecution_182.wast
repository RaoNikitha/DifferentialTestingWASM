;; 3. Test Description: Use a block containing a `nop` followed by an `unreachable` and another instruction. Validate that the `unreachable` correctly traps and the subsequent instruction is not executed.

(assert_invalid (module (func (block (nop) (unreachable) (i32.const 1)))) "unreachable executed")