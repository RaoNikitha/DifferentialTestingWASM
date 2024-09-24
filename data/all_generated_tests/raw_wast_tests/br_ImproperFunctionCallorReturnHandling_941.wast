;; 2. Inside a deeply nested loop structure, include `call` instructions to various functions and employ `br` to target labels incorrectly, potentially causing a jump before the function calls return, thus missing out on proper return value handling.

(assert_invalid
  (module
    (func $deeply_nested_loop
      (block
        (loop (result i32)
          (call $someFunction)
          (block
            (call $anotherFunction)
            (br 2)
          )
        )
      )
    )
    (func $someFunction (result i32) (i32.const 10))
    (func $anotherFunction (result i32) (i32.const 20))
  )
  "type mismatch"
)