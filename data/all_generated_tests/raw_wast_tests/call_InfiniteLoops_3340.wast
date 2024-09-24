;; 9. **Test 9: Loop with Function Call Interchanging `br` Targets**    - **Constraint:** Ensure `br` targets are correctly updated after function calls within a loop.    - **Description:** Implement a loop that modifies `br` targets via a function call. Incorrectly updating branch targets post function call should cause an infinite loop.

(assert_invalid
  (module
    (func $modify_br_target (result i32)
      i32.const 1
    )
    (func (loop $loop
      (call $modify_br_target)
      br $loop
    ))
  )
  "unreachable"
)