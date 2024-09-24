;; 4. **Test 4:** Nested blocks with an `unreachable` instruction in the inner block followed by normal instructions in the outer block. It tests whether the outer block's instructions are correctly skipped due to the trap in the inner block. ```wat (function (result i32)   (block (result i32)     (block (result i32)       unreachable       (i32.const 40)     )     (i32.const 50)   ) ) ```

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32)
        unreachable
        (i32.const 40)
      )
      (i32.const 50)
    )
  ))
  "type mismatch"
)