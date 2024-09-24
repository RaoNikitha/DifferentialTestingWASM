;; 7. **Test Description**:    Implement a sequence of blocks with increasing complexity and depth, each generating a sequence of values. Perform a forward branch at several nesting levels. Verify how the environment maintains stack states during multiple labels and their corresponding exits, ensuring stack consistency through nested control flows.

(assert_invalid
  (module 
    (func $complex-nesting 
      (block (result i32) 
        (block (result i32) 
          (i32.const 42) 
          (br 1) 
        ) 
        (i32.const 0)
      ) 
      (i32.add)
    )
  )
  "type mismatch"
)