;; 7. **Test Description:**    Use a `br` to exit a `block` prematurely before all intended operands have been pushed onto the stack.    **Constraint Checked:** Proper handling and clearing of partially completed operand stacks during early branch exits.    **Relation to Stack Corruption:** Incomplete stacks could leave garbage operands leading to corruption.

(assert_invalid
  (module (func $early-exit-stack-corruption
    (block (result i32) (i32.const 1) (br 0) (i32.const 2))
  ))
  "type mismatch"
)