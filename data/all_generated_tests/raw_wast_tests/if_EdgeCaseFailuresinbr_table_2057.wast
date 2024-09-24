;; 8. **Stack Growth and Shrinkage Before `br_table`**:    - Design a test that puts a series of pushing and popping operations on the stack before a `br_table` inside an `if` condition. This would check the consistency of stack state handling and reset mechanisms between different implementations, specifically how they restore the stack for `br_table`.

(assert_invalid
  (module
    (func $stack-growth-shrink-br_table 
      (i32.const 0) 
      (i32.const 1) 
      (if (result i32) 
        (then 
          (i32.const 2) 
          (i32.const 3) 
          (drop) 
          (i32.const 0) 
          (br_table 0 (i32.const 0))
        ) 
        (else 
          (i32.const 4) 
          (drop) 
          (i32.const 0)
        )
      ) 
      (drop)
    )
  )
  "type mismatch"
)