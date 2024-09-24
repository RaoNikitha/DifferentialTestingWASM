;; 8. **Test Description**: A function containing sequential `br_table` instructions targeting varying blocks, some with nested `return` instructions to test multiple indirect branches.    - **Constraint**: Ensures consistent return type validation across multiple indirect branches.

(assert_invalid
 (module
  (func $test (result i32)
   (block
    (block
     (block
      (br_table 0 1 2 (i32.const 1)))
     (return))
    (return))
   (return))
 )
 "type mismatch"
)