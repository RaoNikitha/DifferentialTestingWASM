;; Test 10: Create a loop with a block inside it that involves stack manipulation leading to a type inconsistency when the loop is attempted to be re-entered via a backward branch. This will test if reinitialization of the loop correctly handles type constraints.

(assert_invalid
  (module (func
    (i32.const 0)
    (loop (result i32)
      (block (i32.const 1) (br 1))
      (drop)
    )
  ))
  "type mismatch"
)