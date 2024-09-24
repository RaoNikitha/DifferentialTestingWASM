;; 8. Try a deliberate misplacement of `unreachable` in a chain of binary operations (e.g., `i32.add`). Check to confirm if the invalid opcode handling manages to trap on encountering ‘unreachable’ inserted in the middle of valid operations.

(assert_invalid
  (module (func $unreachable-mid-operation
    (i32.const 1) (unreachable) (i32.const 2) (i32.add)
  ))
  "type mismatch"
)