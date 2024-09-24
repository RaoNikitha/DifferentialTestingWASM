;; - **Test 8**: Create a test that includes a `select` instruction to pick values for a function call and ensure one branch has a mismatched type (`f32` vs `i32`). This ensures `select` type validation prior to function call.

(assert_invalid
  (module
    (func $type-mismatch-in-select
      (param i32) (param f32)
      (result i32)
      local.get 0
      local.get 1
      i32.const 1
      select
      call 1
    )
    (func (param i32) (result i32)
      local.get 0
    )
  )
  "type mismatch"
)