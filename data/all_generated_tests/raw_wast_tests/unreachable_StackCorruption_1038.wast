;; 9. Test Description: Execute `unreachable` within a sequence where the stack is intentionally made to underflow with operations like popping more items than pushed. Validate that the trap does not mask underlying stack issues.

(assert_invalid
  (module (func $stack-underflow (result i32)
    (unreachable)
    (drop)
  ))
  "stack underflow"
)