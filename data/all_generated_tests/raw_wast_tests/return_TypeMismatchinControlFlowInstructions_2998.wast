;; A function misuses a return instruction within a block to return an object type, incompatible with the function's integer return type, to ensure stacks unwind and manage operand types accurately.

(assert_invalid
  (module
    (func $misuse-return-in-block (result i32)
      (block (return (f64.const 3.14)))
    )
  )
  "type mismatch"
)