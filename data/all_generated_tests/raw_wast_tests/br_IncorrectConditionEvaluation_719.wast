;; 10. **Test: Early Branch Exit with `br_if` in a Multi-Block Structure**     - **Description:** Construct a multi-block structure where `br_if` is used to exit early from one block and enter another based on a condition. The condition should reflect a significant change in control flow if true.     - **Constraint:** Ensure that the `br_if` correctly evaluates the condition and transfers control as specified, accurately testing condition evaluation in complex control structures.

(assert_invalid
  (module
    (func $early-branch-exit (param $cond i32) (param $val i32) (result i32)
      (block $outer
        (block $inner
          (br_if $outer (get_local $cond))
          (block
            (return (get_local $val))
          )
          (br $inner)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)