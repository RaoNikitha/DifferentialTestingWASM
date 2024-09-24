;; 4. **Test Description 4**:    - Use a `br_if` conditional within a `loop` to dynamically select functions via `call_indirect`. The condition always evaluates to true, but an improper condition check causes the loop to never break and endlessly call the function.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 2 funcref)
    (func $callee-1 (param i32) (result i32)
      local.get 0
    )
    (elem (i32.const 0) $callee-1)
    (func $test (param i32) (result i32)
      (local i32)
      (block (result i32)
        (local.set 1 (local.get 0))
        (loop (result i32)
          (br_if 0 (i32.const 1))
          (call_indirect (type 0) (local.get 1) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)