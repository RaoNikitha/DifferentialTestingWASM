;; Create a nested block scenario where the outer block calls a function that modifies the stack order or depth, then the nested block indirectly calls another function expected to follow the modified state. This checks function call impacts on operand stack within nested block constraints.

(assert_invalid
  (module
    (func $alter_stack
      (i32.const 42)
    )
    (func $type-nested-block-stack-modification (result i32)
      (block (result i32)
        (call $alter_stack)
        (block
          (call $alter_stack)
          (br 1)
        )
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)