;; 3. **Test 3: Loop with `nop` and `unreachable`**:    - **Description**: A loop contains `nop` instructions and an `unreachable` instruction designed to trap if reached incorrectly.    - **Constraint**: Validate `nop`’s non-effect on subsequent `unreachable` reaching logic.    - **Relation to Infinite Loops**: Ensures that `nop` doesn't mistakenly cause an infinite loop by making the `unreachable` part of the loop unreachable.    - **Example**: `(loop $L (nop) (br_if $L (i32.const 1)) (unreachable))`

(assert_invalid
  (module
    (func $test-loop (loop $L (nop) (br_if $L (i32.const 1)) (unreachable)))
  )
  "unreachable instruction not reachable"
)