;; 4. **Test 4**: Design a sequence of nested `block` instructions where the `br_if` condition is dynamically determined at runtime. The branch should target a non-innermost block. Confirm that the correct block is targeted, ensuring dynamic conditions don't disrupt the proper label lookup.

(assert_invalid
  (module (func $dynamic-condition-target (result i32)
    (block (result i32) 
      (i32.const 1)
      (block (result i32) 
        (i32.const 2)
        (block (result i32)
          (br_if 2 (i32.const 1))
        )
      )
    ) 
    (i32.const 0)
  ))
  "type mismatch"
)