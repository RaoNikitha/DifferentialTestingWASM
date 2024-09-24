;; 3. **Test 3: Return Type Mismatched in Branch Target Labels**    - Implement a `br_table` where the target labels result in functions with incorrect return type arity, testing if the arity mismatch correctly triggers an error and avoids unintended return behavior.

(assert_invalid
  (module (func $return-type-mismatch
    (block (result i32)
      (block (result i64)
        (br_table 0 1 (i32.const 0))
      )
    )
  ))
  "type mismatch"
)