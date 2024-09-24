;; 8. Design a test where a block type's result constraints are directly violated by internal branches, especially where branching instructions (like `br_if`) lead to paths producing different stack results than expected. This confirms CFG alignment with type constraints.

(assert_invalid
  (module (func $block-type-violation (result i32)
    (block (result i32)
      (block (result i32) 
        (i32.const 1) 
        (br_if 0 (i32.const 0)) 
        (i64.const 2) 
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)