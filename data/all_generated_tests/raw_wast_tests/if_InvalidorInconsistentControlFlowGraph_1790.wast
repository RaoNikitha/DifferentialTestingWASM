;; 1. Create an `if` block with a missing `else` clause and a mismatched block type, where the `then` block doesn't conform exactly to the specified function type’s output.

(assert_invalid
  (module
    (func $mismatch-block-type
      (if (result i32) (i32.const 1) (then))
    )
  )
  "type mismatch"
)