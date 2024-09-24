;; 10. **Test Description:** Create a sequence of instructions that perform stack operations, ending with `unreachable`, to test stack-polymorphic behavior.    **Constraint:** Regardless of the stack state before `unreachable`, executing it should cause a trap.    **Relation to Unreachable Code Execution:** Confirms that `unreachable` is stack-polymorphic and traps regardless of stack content.

(assert_invalid
  (module (func $stack-polymorphic-unreachable-test (result i32)
    (i32.const 0) (i64.const 1) (f32.const 2.0) (unreachable) (i32.const 3)
  ))
  "type mismatch"
)