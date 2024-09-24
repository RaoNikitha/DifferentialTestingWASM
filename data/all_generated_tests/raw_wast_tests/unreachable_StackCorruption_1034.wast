;; 5. Test Description: Embed `unreachable` within an `if-else` conditional where the `else` block attempts to use the stack. This tests if the execution halts correctly, preventing stack operations in the `else` block.

(assert_invalid
  (module (func $type-if-else-unreachable-stack (result i32)
    (i32.const 1) (if (result i32) (then (unreachable)) (else (i32.add (i32.const 1) (i32.const 2))))
  ))
  "type mismatch"
)