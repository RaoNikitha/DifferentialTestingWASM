;; Test 2: Out of Bounds Table Index - **Constraint/Issue**: Checks handling of invalid table index during function resolution. - **Test Description**: Index into the function table with an operand that is out of bounds. Ensure `call_indirect` traps due to the invalid index.

(assert_invalid
 (module
   (type (func))
   (table 1 funcref)
   (func $out_of_bounds_table_index (call_indirect (type 0) (i32.const 1) (i32.const 1)))
 )
 "index out of bounds"
)