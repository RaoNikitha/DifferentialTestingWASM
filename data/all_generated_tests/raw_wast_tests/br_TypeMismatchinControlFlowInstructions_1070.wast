;; 1. Create a block that expects an integer result, and within it, branch to an outer block without placing an integer on the stack. This should test whether the implementation correctly handles the type mismatch for the block result type.

(assert_invalid
  (module
    (func $type-arg-missing-in-br
      (block (result i32)
        (block
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)