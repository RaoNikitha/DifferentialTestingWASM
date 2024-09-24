;; 10. **Mutable Global as Condition**:     - Use a mutable global variable as the condition for `br_if` (`global.get 0`, `br_if 0`). Modify the global and see if `br_if` properly evaluates the variable’s new state.          Constraints: Verifies if runtime changes in mutable globals are correctly picked up by conditional branches.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test
      (block (br_if 0 (global.get 0)))
      (global.set $g (i32.const 1))
      (block (br_if 0 (global.get 0)))
    )
  )
  "type mismatch"
)