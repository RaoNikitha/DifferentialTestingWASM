;; 10. Establish a test case with a complex mixture of nested `block` and `loop` constructs with several levels of nesting, and use `br_if` to conditionally branch out to various depths of the block structure based on different conditions. Ensure the correct block targeting and proper operand management based on the condition. Constraints checked: conditional branching accuracy, stack restoration consistency.

(assert_invalid
  (module
    (func (param i32) (param i32) (param i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (loop (result i32)
                (loop (result i32)
                  (i32.const 1)
                  (local.get 0)
                  (br_if 3)
                  (i32.const 2)
                  (local.get 1)
                  (br_if 2)
                  (i32.const 3)
                  (local.get 2)
                  (br_if 1)
                  (br 0)
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)