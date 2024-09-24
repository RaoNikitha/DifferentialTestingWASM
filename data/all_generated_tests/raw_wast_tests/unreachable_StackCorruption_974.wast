;; 5. **Test Description:**    A block structure that includes `unreachable` followed by different instructions to ensure the block's stack handling respects the `unreachable`'s immediate trap.    <br>**Constraint:** Confirm stack conformity by ensuring subsequent instructions never run and thus don't change the stack state.

(assert_invalid
  (module (func $test_unreachable_block_stack
    (block (unreachable) (i32.const 1) (drop))
  ))
  "type mismatch"
)