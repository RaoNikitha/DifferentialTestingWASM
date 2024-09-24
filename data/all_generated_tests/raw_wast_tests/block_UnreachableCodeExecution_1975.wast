;; 6. **Incorrect Operand Stack Management Reaching Unreachable**:    - A test with a `block` where improper handling of the operand stack causes instructions to consume values wrongfully, leading control flow into an `unreachable` instruction. This could surface due to differences in context labels' extension.

(assert_invalid
  (module
    (func $incorrect-operand-stack 
      (block (result i32)
        (i32.const 2)
        (i32.add)
        (unreachable)
      )
    )
  )
  "type mismatch"
)