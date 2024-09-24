;; 5. **Test Name**: Incorrect Blocktype with Mismatched Result Types    **Description**: Define an `if` block with a specific `blocktype` and follow it with `then` and `else` blocks that do not conform to the result type specified.    **Constraints Checked**: Matching of `blocktype` with `then` and `else` results.    **CFG Issue**: Ensures result type compliance, avoiding mismatches in the CFG.

(assert_invalid
 (module (func $incorrect-blocktype (result i32)
   (if (result i32) (i32.const 1) 
     (then (i32.const 1) (i32.const 2)) 
     (else (nop))
   )
 ))
 "type mismatch"
)