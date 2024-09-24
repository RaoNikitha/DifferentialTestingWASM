;; 5. **Test 5:** A complex function containing multiple instances of the `unreachable` instruction inside different control structures to see if the position tracking of each trap causing instruction remains consistent and traps appropriately. ```wat (function (param i32) (result i32)   (block     (loop       (if (i32.eq (local.get 0) (i32.const 0))         (then unreachable)       )       (br 0)     )     (i32.const 60)     unreachable   ) ) ```

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block
        (loop
          (if (i32.eq (local.get 0) (i32.const 0))
            (then unreachable)
          )
          (br 0)
        )
        (i32.const 60)
        unreachable
      )
    )
  )
  "type mismatch"
)