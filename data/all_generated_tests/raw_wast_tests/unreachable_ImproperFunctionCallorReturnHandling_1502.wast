;; 3. **Test Description:**    - A function uses `unreachable` midway, then attempts to use `call` and `return` within a block. The test checks if the `return` from the called function is ignored.    - **Constraint:** The function must trap before any return values are processed.    - **Improper Function Call or Return Handling:** Ensures return handling is correctly nullified by the `unreachable` trap.

(assert_invalid
  (module (func $unreachable-call (result i32)
    (block (result i32)
      (unreachable) (call 1) (return)
    )
  ))
  "type mismatch"
)