;; 6. **Test Description**:    Design a block sequence where an inner block executes an `unreachable` instruction after branching outward from the inner block. The test ensures both implementations correctly manage inner block control flow, leading to an `unreachable` state if wrongly implemented.

(assert_invalid
  (module (func $unreachable-after-branch
    (block (result i32) 
      (block (br 1) (unreachable))
    (i32.const 42))
  ))
  "unreachable executed"
)