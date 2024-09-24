;; 4. **Test Description**: Call a deeply nested function with multiple `br_if` instructions depending on key computations. If conditions always evaluate to true or false, it should prematurely exit or skip key steps, evidencing differential behavior.

(assert_invalid
  (module
    (func $deep-nested-call
      (block
        (loop
          (if (i32.const 1)
            (br_if 1 (i32.const 1))
          )
          (call 2 (i32.const 0) (i32.const 1))
        )
      )
    )
    (func (param i32 i32))
  )
  "type mismatch"
)