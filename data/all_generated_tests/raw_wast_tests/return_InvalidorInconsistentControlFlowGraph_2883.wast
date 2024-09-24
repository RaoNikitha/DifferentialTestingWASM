;; 2. **Test 2**: Define a function that uses `return` within a loop construct. Ensure that `return` is placed in such a way that it should exit the function immediately but verify if the engine incorrectly continues looping due to misaligned loop structures.

(assert_invalid
  (module
    (func $type-value-loop-with-return (result i32)
      (loop (i32.const 0) (return) (br 0))
    )
  )
  "type mismatch"
)