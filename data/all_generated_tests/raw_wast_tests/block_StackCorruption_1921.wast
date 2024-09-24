;; Test 2: A `block` that concludes by pushing a value to the stack and then an adjacent `br_if` that conditionally branches out of the block. Verify if the condition is handled correctly and the stack respects the block's expected output type.

(assert_invalid
  (module (func $type-block-br_if-stack (result i32)
    (block (result i32)
      (i32.const 10)
      (br_if 0 (i32.const 0))
    )
  ))
  "type mismatch"
)