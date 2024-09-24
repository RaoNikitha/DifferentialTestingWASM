;; 2. **Test 2: Stack Overflow on Return**   Create a function within a module that calls an exported function from another module, which has deeply nested blocks and eventually returns a large number of values. Simulate a potential stack overflow condition to see if there is an inconsistency in how both engines manage stack unwinding.   **Constraint**: Validate the management of stack height and ensure proper stack unwinding without overflow errors.   **Relation to Incorrect Handling of Control Flow**: Tests stack management across module-boundary calls, pushing the stack's limits.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (export "test_stack_overflow") (result i32)
      (block (loop 
        (br_if 1 (i32.eqz (call $external_func)))
        (return (i32.const 0))
      ))
    )
  )
  "type mismatch"
)