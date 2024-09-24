;; 5. **Test Description:**    Construct a module where an `if` instruction conditionally calls an imported function that uses the `unreachable` instruction. This test ensures that an unconditional trap within an imported function appropriately propagates back across the module boundary, preserving control flow integrity and stack state consistency in the originating module.

(assert_invalid
 (module
  (import "env" "unreachable_func" (func $unreachable_func (result i32)))
  (func $test_func (result i32)
    (if (result i32)
      (i32.const 1)
      (then (call $unreachable_func))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)