;; 10. **Test 10:** Combining local variables' manipulation with `unreachable` instruction in a loop to ensure that all modifications are halted as soon as the trap is encountered, preventing any further execution. ```wat (function (param i32) (result i32)   (local i32)   (loop (result i32)     (local.set 0 (i32.add (local.get 0) (i32.const 1)))     (if (i32.eq (local.get 0) (i32.const 3))       (then         unreachable       )     )     (br 0)     (local.get 0)   ) ) ```

(assert_invalid
  (module (func (param i32) (result i32)
    (local i32)
    (loop (result i32)
      (local.set 0 (i32.add (local.get 0) (i32.const 1)))
      (if (i32.eq (local.get 0) (i32.const 3))
        (then
          unreachable
        )
      )
      (br 0)
      (local.get 0)
    )
  ))
  "type mismatch"
)