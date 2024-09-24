;; Test 1: Insert multiple `nop` instructions between critical stack operations like `i32.const` and `i32.add`, ensuring the stack remains unchanged to catch any mismanagement or corruption.

(assert_invalid
  (module (func (result i32) (i32.const 1) (nop) (nop) (i32.const 2) (i32.add) (nop)))
  "type mismatch"
)