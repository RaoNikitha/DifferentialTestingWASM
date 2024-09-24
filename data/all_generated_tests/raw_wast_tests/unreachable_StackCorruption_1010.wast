;; 1. **Test: Mixed Types After Unreachable**    - Place an `unreachable` instruction followed by a mix of different type instructions such as `i32.const 1`, `i64.const 2`. This will test how the stack is handled when the types on the stack are different across implementations.    - **Stack Corruption Check:** Ensure no further instructions corrupt the stack after the `unreachable` instruction. The test focuses on stack type integrity.

(assert_invalid
  (module (func $mixed-types-after-unreachable
    (unreachable) (i32.const 1) (i64.const 2)
  ))
  "type mismatch"
)