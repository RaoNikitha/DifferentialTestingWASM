;; 7. Create a deeply nested control structure with multiple nested `block`, `loop`, and `if` constructs. Use `br` to target outer blocks from deeper nested structures. This ensures the target block is correctly resolved and the operand stack is correctly managed. Constraints checked: label resolution depth, proper stack unwinding and consistency.

(assert_invalid 
  (module 
    (func $nested-br-to-outer-block 
      (block 
        (i32.const 42) 
        (block 
          (loop 
            (if (i32.const 1) 
              (then (block (br 3))))))))) 
  "unknown label")