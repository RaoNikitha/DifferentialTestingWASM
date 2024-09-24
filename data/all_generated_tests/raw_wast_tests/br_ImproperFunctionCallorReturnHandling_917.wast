;; 8. Test Description: Write a complex function which calls another function that includes nested `block` and `loop` instructions, ensuring a `br` instruction incorrectly targets a label causing improper stack handling during function return.

(assert_invalid
  (module
    (func $complex-function
      (block 
        (block 
          (loop
            (call $inner-function)
            (br 3) 
          )
        )
      )
    )
    (func $inner-function (param) 
      (block (result i32)
        (i32.const 42)
      )
    )
  )
  "unknown label"
)