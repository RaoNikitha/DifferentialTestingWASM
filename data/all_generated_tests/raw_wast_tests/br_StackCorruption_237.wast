;; 8. Design a function with various `block` statements and use `br` inside a nested block to jump to an enclosing block, then call this function repeatedly. Look for stack overflow scenarios due to improper management of stack heights and operand integrity when returning from the call.

(assert_invalid
  (module
    (func $stack-mismanagement-blocks
      (block $L0
        (block $L1
          (block $L2
            (br 2)
          )
        )
      )
      (i32.const 0) ;; simulate multiple calls and potential stack overflow
      (call 0)
      (call 0)
      (call 0)
      (call 0)
      (call 0)
      
    )
  )
  "stack mismanagement"
)