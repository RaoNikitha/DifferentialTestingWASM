;; 8.  *Test Description*: Test the execution of an exported function that involves branching to an `if` block, which imports another function and branches within.     *Constraint Being Checked*: Verifies that nested branches involving if-statements are properly executed with maintained control flow and operand stack integrity across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (result i32)
      (block (result i32)
        (block (result i32) 
          (if (result i32)
            (i32.const 1)
            (then (call $external_func) (br 1))
          )
          (i32.const 2)
          (br 0)
        )
      )
    )
    (export "test_func" (func 0))
  )
  "type mismatch"
)