;; 5. Nested `if` structures with inner functions called by `call_indirect`, followed by `br` instructions that should return correctly post-`if`, testing differences in how function returns are managed regarding the operand stack.

(assert_invalid
  (module 
    (type $sig (func (result i32)))
    (func $test
      (block (result i32)
        (block (result i32)
          (if (i32.const 1)
            (then (call_indirect (type $sig) (i32.const 0)))
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)