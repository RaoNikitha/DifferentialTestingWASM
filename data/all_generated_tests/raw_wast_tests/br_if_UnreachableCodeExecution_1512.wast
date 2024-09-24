;; 3. **Test 3 - Unreachable After Valid `br_if`**:    Construct a scenario where `br_if` condition is true, and the branch is taken to a place where the next instruction is `unreachable`. This tests the correct branch operation followed by the execution of an `unreachable` operation.

(assert_invalid
  (module (func $test-unreachable
    (block (br_if 0 (i32.const 1)) (unreachable))
  ))
  "type mismatch"
)