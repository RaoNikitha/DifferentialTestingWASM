;; 1. **Test 1: Nested Function Calls with Mismatched Arguments**      Description: Create a WebAssembly module where a function calls another function nested inside an 'if' condition. Ensure that the number of arguments passed to the inner function does not match its parameter signature. This tests if the implementations handle argument verification and transfer correctly, as incorrect handling may cause branch target resolution errors when leaving the 'if' block.      Constraint: The inner function must expect more arguments than provided to trigger argument transfer validation.      Relation to Branch Target Resolution: The discrepancy in arguments can cause an incorrect 'if' branch resolution, leading to unexpected behavior.

(assert_invalid
  (module
    (func $inner (param i32 i32))
    (func $outer
      (i32.const 1)
      (if
        (then
          (call $inner (i32.const 42)) 
        )
      )
    )
  )
  "type mismatch"
)