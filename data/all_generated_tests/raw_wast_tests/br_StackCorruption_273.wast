;; 4. **Test for Mismanaged Stack with Multiple Forward Branches:**    - Construct a scenario where multiple `br` instructions target blocks of different nesting levels one after another and verify if each branch correctly manages and restores the operand stack top values.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (i32.const 10)
        (block (result i32)
          (i32.const 20)
          (block (result i32)
            (br 2)
            (i32.const 30)
          )
          (br 1)
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)