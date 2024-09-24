;; 8. **Test 8:** A switch-like structure using multiple br_table with an `unreachable` instruction to ensure the correct branch is evaluated while respecting the trap. ```wat (function (param i32) (result i32)   (block     (br_table 0 1 2 (local.get 0))     (unreachable)   )   (i32.const 80) ) ```

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block
        (br_table 0 1 2 (local.get 0))
        (unreachable)
      )
      (i32.const 80)
    )
  )
  "type mismatch"
)