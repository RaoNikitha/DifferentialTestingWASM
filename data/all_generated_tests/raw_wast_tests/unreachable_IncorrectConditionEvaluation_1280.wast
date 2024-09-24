;; - **Test 1: Unreachable inside Block with Conditional Branch**   ```   Check that an `unreachable` instruction inside a `block` with a `br_if` evaluated to false correctly traps. If the `br_if` misinterprets its condition due to a code implementation bug, it could incorrectly take the branch and avoid the `unreachable` instruction, causing differential behavior.   ``` -

(assert_invalid
  (module (func $undefined-behavior-with-unreachable
    (block
      (br_if 0 (i32.const 0))
      (unreachable)
    )
  ))
  "unreachable executed"
)