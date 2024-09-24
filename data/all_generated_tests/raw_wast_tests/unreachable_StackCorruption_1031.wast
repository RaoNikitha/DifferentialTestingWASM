;; 2. Test Description: Place `unreachable` within a nested block structure that would normally return a value. Observe if stack balances correctly after exiting from nested structures due to the trap caused by `unreachable`.

(assert_invalid
  (module (func $type-block-value-nested-unreachable-num-vs-void-nested
    (block (block (unreachable)) (i32.const 0))
  ))
  "type mismatch"
)