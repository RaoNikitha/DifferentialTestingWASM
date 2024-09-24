;; 6. **Nested Blocks with Varying `blocktype`**:    Create nested blocks, each with different `blocktype` (e.g., no result type vs. specific result type), and ensure the correct result types are enforced when each block is exited. Check for type validation consistency across nested blocks.

(assert_invalid 
  (module (func $nested-block-var-type 
    (block (result i32) 
      (block (result f64) 
        (br 1 (f32.const 1.0)) 
      ) 
      (i32.const 0) 
    ) 
  )) 
  "type mismatch" 
)