;; 3. **Test 3:** An `if` conditional structure where the `then` branch has an `unreachable` instruction but the `else` branch contains valid operations. The test checks if interpreters correctly trap in the `then` branch and continue as expected in the `else` branch. ```wat (function (param i32) (result i32)   (local.get 0)   (if (result i32)     (then       unreachable       (i32.const 1)     )     (else       (i32.const 0)     )   ) ) ```

(assert_invalid
  (module
    (func (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (then
          unreachable
          (i32.const 1)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)