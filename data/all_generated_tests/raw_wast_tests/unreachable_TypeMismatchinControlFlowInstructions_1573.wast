;; 4. **Test Description:** Insert `unreachable` inside a nested `block` inside a `loop`, and validate with instructions that require specific operand types at the end of the block.    **Constraint:** Disrupt stack types via `unreachable`, verifying the consistency of instructions that depend on block-exit types.    **Reasoning:** Ensures that nested control structures handle the stack-polymorphic nature of `unreachable`.

(assert_invalid
 (module
  (func $test_nested_unreachable
   (loop
    (block
     (unreachable)
     (i32.const 42)
    )
    (i32.add)
   )
  )
 )
 "type mismatch"
)