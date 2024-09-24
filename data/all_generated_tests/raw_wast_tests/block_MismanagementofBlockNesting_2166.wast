;; 7. **Test 7**:    Implement nested blocks where a branch in the innermost block uses `br` to skip to the outer block, but ensures intervening branches are ignored. This tests precise management of block depth and start positions within the engines.

(assert_invalid
  (module (func $br-nested-blocks-skip-outer 
    (block (result i32) 
      (block (result i32) 
        (br 1 (i32.const 1)) 
        (br 0 (i32.const 2))
      ) 
      (i32.const 0)
    ) 
  )) 
  "type mismatch" 
)