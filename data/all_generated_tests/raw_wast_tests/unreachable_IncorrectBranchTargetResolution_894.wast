;; 5. **Test Unreachable in Cross-nested Blocks and Loops:** Design a function with alternating blocks and loops, embedding an `unreachable` in one of the nested constructs. Validate that `br` instructions identify the correct exit points and trap appropriately when encountering `unreachable`.

(assert_invalid
  (module (func $cross-nested-blocks-loops (result i32)
    (block (loop (block (loop (unreachable) (br 3)) (br 2)) (i32.const 1)))
  ))
  "type mismatch"
)