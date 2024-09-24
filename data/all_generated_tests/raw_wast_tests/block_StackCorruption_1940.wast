;; 1. Create a test where a `block` is initialized with a specific block type requiring a non-empty stack and includes branching to test proper unwinding. Ensure the instructions inside the `block` modify the stack height before branching. The goal is to check if incorrect label indexing and stack manipulation in `wizard_engine` result in stack corruption after branching.

(assert_invalid
  (module (func $block-proper-unwind (result i32)
    (i32.const 42)
    (block (result i32) (i32.const 1) (br 0) (i32.const 2))
  ))
  "type mismatch"
)