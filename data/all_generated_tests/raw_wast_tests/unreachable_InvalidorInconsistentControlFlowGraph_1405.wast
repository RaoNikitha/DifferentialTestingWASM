;; 6. **Test 6:** A function where an `unreachable` instruction is utilized within `br_if` to ensure no instructions are executed after the guarded jump is not taken. ```wat (function (param i32) (result i32)   (block (result i32)     (br_if 0 (i32.eq (local.get 0) (i32.const 1)))     unreachable     (i32.const 70)   ) )

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (br_if 0 (i32.eq (local.get 0) (i32.const 1)))
        unreachable
        (i32.const 70)
      )
    )
  )
  "constant expression required"
)