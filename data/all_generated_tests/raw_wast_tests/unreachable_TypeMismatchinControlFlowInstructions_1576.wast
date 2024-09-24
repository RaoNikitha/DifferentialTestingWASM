;; 7. **Test Description:** Formulate a test with an `unreachable` inside a `block` with an explicit return type, surrounded by stack-manipulative instructions like multiple `drop` that depend on the block’s stack consistency.    **Constraint:** The stack typing needs to be verified even with multiple instructions that affect stack depth/type.    **Reasoning:** Assures that complex stack operations around `unreachable` maintain type consistency.

(assert_invalid
  (module (func $complex-unreachable-stack-manipulation
    (block (result i32) 
      (i32.const 42) 
      (drop)
      (i32.const 1)
      (unreachable)
      (i32.const 2)
    )
  ))
  "type mismatch"
)