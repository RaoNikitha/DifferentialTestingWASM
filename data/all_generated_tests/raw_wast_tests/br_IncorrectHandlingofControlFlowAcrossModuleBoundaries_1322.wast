;; 3. Test `br` within an `if` block that results in a call to an imported function, testing the handling of the unwinding stack when crossing the module boundary and ensuring the correct target label restoration.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (block
        (block
          (if (i32.const 1)
            (then
              (call $external_func)
              (br 1)
            )
          )
        )
      )
      (return (i32.const 0))
    )
  )
  "type mismatch"
)