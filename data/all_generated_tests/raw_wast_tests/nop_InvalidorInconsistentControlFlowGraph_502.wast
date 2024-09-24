;; 3. **Test 3: `nop` Before Unreachable**    - **Constraint Check**: Confirm that placing `nop` before an `unreachable` instruction does not affect the unreachable code detection.    - **Description**: Place a `nop` instruction immediately before an `unreachable` instruction and ensure the code beyond `unreachable` is correctly identified as unreachable.

(assert_invalid
  (module
    (func $test-unreachable
      nop
      unreachable
      i32.const 1
    )
  )
  "unreachable"
)