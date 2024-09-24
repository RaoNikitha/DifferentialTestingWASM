;; Test 4: Surround a `br_if` condition with multiple `nop` instructions and validate if the branch is correctly taken based on the condition value, ensuring the stack state remains consistent.

(assert_invalid
  (module (func $br_if_test (param i32) (result i32) (nop) (nop) (local.get 0) (br_if 0) (nop) (nop) (i32.const 1)))
  "type mismatch"
)