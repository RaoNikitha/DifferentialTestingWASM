;; 9. In a `block`, invoke an imported function leading to another imported function call, within nested `block` instructions. Check for consistent operand stack behavior and return address integrity through layers.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (param i32) (result i32)))
    (import "env" "func2" (func $func2 (result i32)))
    (func $test
      (block (result i32) 
        (block (result i32) 
          (call $func1
            (block (result i32) 
              (block (result i32)
                (call $func2)
                (br 0)
              )
              (i32.const 0)
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)