;; 4. **Test Description:**    - Build a function with deeply nested loops and blocks. Insert `br` instructions to jump out of inner blocks to outer blocks, mixing forward and backward branches. Test different sequences of operand stack states at each jump to identify any corruptions or mismanagement.

(assert_invalid
  (module
    (func $complex-br
      (block $outer
        (block $inner (br 1))
        (loop $loop
          (br_if 1 (i32.const 1))  
        )
      )
    )
  )
  "type mismatch"
)