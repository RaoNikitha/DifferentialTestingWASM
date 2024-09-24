;; 4. **Test 4: BrTable within Nested Blocks with Function Calls**    - Design a test with `br_table` nested in multiple blocks, where labels target function calls with different arities than expected. Check if error handling within nested contexts correctly identifies and handles these mismatches.

(assert_invalid
  (module
    (func $nested-br_table (param i32)
      (block
        (block
          (loop
            (br_table 0 1 (i32.const 2) (call $function_with_arity_1 (i32.const 5))))
          )
        )
      )
    (func $function_with_arity_1 (param i32)) 
  )
  "type mismatch"
)