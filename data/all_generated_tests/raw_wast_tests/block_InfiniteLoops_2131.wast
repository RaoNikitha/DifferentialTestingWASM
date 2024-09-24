;; 2. **Test Description**: Define a `block` with nested `loop` where an inner `br_if` condition incorrectly evaluates, potentially endlessly branching within the loop.    - **Constraint**: Checks if the `br_if` condition properly exits the loop, avoiding infinite looping.

(assert_invalid
  (module (func $test-infinite-loop
    (block (loop (br_if 0 (i32.const 1))) (unreachable))
  ))
  "infinite loop"
)