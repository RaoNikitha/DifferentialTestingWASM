;; 1. Create a block that evaluates an `i32.eq` operation with `br_if`, checking if the branch is taken based on comparing different constants. The test will check if the condition evaluation correctly influences the branch decision within the block.

(assert_invalid
 (module (func $branch-condition (result i32)
  (block (result i32)
   (i32.const 5)
   (i32.const 5)
   (i32.eq)
   (br_if 0)
   (i32.const 10)
   (drop)
  )
  (i32.const 20)
 ))
"type mismatch"
)