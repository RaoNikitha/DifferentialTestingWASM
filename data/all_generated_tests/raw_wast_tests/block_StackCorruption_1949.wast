;; 10. Create a test involving a `block` that performs extensive stack operations before a `br` targets an outer block. The test should verify if the stack's final state aligns with expectations, revealing any stack corruption issues caused by incorrect label handling and context extension in `wizard_engine`.

(assert_invalid
  (module (func (result i32)
    (block (result i32) 
      (i32.const 42) 
      (block (result i32) 
        (i32.const 10)
        (i32.const 20)
        (br 1)
      )
      (drop)
      (i32.const 100)
    )
    (i32.const 50)
  ))
  "type mismatch"
)