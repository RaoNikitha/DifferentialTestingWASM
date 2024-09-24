;; 4. **Test Description:** Construct a module where `br_if` is used within a `loop` and call an imported function that itself contains another loop with a `br_if`.    **Constraint Checked:** Stack and control integrity within nested loops across module boundaries.    **Relation:** Validates the loop control integrity and stack state when executing branched loops across module calls.

(assert_invalid
  (module
    (import "env" "nested_loop_func" (func $nested_loop_func))
    (func (loop
      (call $nested_loop_func)
      (br_if 0 (i32.const 1))
    ))
  )
  "type mismatch"
)