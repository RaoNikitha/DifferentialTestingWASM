;; Test 5: Use `br_table` with an operand resulting in the minimum value that should still branch correctly, ensuring there are no off-by-one errors in boundary condition handling.

(assert_invalid (module (func $min-value-boundary (result i32) (block (result i32) (br_table 0 1 (i32.const 0x80000000)) (i32.const 2))) ) "unknown label")