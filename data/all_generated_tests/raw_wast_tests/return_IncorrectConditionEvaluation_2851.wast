;; 10. Implement a function where operand stack manipulation is driven by complex conditions evaluated by `br_if`, with a `return` occurring inside the branch. Validate the stack's state post-return and the accuracy of condition evaluations leading to the return.

(assert_invalid
  (module
    (func $complex_stack_manipulation (result i32)
      (local i32)
      (i32.const 1) (i32.const 2) (i32.add) (local.set 0)
      (block $outer (result i32)
        (i32.const 3)
        (br_if $outer (i32.eqz (local.get 0)))
        (return)
      )
      (local.get 0)
    )
  )
  "type mismatch"
)