;; 4. **Call Imported Function with Multiple Labels:**    Write a test involving a call to an imported function that contains multiple nested labels and uses `br` to jump out of them. This would test if the label index space and unwinding are handled across module calls.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func 
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call $external_func)
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)