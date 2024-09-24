;; 7. Develop a test where multiple `nop` instructions are interspersed within a sequence of function calls. This will ensure that each function call and return is correctly handled, with the `nop` instructions having no impact on the overall control flow.

(assert_invalid
  (module
    (func $test (result i32)
      (call $dummy)
      (nop)
      (call $dummy)
      (nop)
      (call $dummy)
    )
    (func $dummy (result i32) (i32.const 0))
  )
  "type mismatch"
)