;; 3. **Test Description**:    Construct a `block` with a `br_if` (conditional branch) targeting an `unreachable` instruction on non-zero condition. Check if both implementations correctly trap, verifying correct execution of conditional branches leading to `unreachable`.

(assert_invalid
  (module (func $test-br_if-unreachable (result i32)
    (block (result i32) (i32.const 0) (br_if 0) (unreachable) (i32.const 1))
  ))
  "unreachable executed"
)