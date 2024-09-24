;; 10. Create a WebAssembly module (`Module A`) that passes control to an imported function ending with `unreachable`. Write Module B that imports and calls this function within a try-catch block. Confirm that `Module B` correctly traps and catches the error, reflecting accurate control flow handling and opcode positioning.

(assert_invalid
  (module 
    (import "env" "some_function" (func $some_function))
    (func $test
      (call $some_function)
      (unreachable)
    )
  )
  "unexpected end"
)

(assert_invalid
  (module 
    (import "env" "some_function" (func $some_function))
    (func $test
      (try 
        (do (call $some_function))
        (catch 
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)