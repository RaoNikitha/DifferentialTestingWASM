;; 5. **Jumping to Default Label with Incorrect Block Results:**    Use `br_table` indexed out-of-bounds to a default label within a loop constructing mixed operand types. Ensure the default label has a result type that does not match what the loop or block expects upon breaking, testing branch-type mismatches.

(assert_invalid
  (module (func $incorrect-block-results
    (block (loop (br_table 0 1 (i32.const 2)) (i32.const 1) (i64.const 1)) (i32.const 3))
  ))
  "type mismatch"
)