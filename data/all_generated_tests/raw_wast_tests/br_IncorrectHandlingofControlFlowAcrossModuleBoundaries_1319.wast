;; 10.  *Test Description*: Create a scenario where a `br` instruction branches to an outer block in an imported function, while the outer block wraps a call to another imported function.     *Constraint Being Checked*: Ensures that outer block label references and operand stack unwinding are properly followed even when nested imports and calls are involved across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $test
      (block (result i32)
        (block
          (call $external_func)
          (br 1)
        )
      )
    )
  )
  "unknown label"
)