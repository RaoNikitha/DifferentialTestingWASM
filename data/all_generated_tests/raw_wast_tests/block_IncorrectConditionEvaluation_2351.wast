;; Test Description 2: A nested `block` structure with an inner `br_if` that branches to the outer block only if a specific condition on the stack is met. Verify that the condition is correctly evaluated before performing the branch.

(assert_invalid
  (module (func $nested-blocks-with-br-if (result i32)
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (i32.const 2)
        (br_if 1 (i32.const 1))
      )
    )
  ))
  "type mismatch"
)