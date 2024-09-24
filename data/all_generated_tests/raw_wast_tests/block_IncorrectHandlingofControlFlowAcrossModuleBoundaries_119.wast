;; Define a block that calls an imported function and catches its exception using a try-catch instruction. Ensure that the control flow and operand stack are correctly managed during the exception handling process, particularly how values are maintained across the module boundaries during the block execution.

 ;; ;; Test that handles block with try-catch and calling an imported function

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_block_with_exception_handling
      (result i32)
      (block (result i32)
        (try (result i32)
          (call $external_func)
        (catch
          (i32.const 0) ; default value in case of exception
        ))
      )
    )
  )
  "type mismatch"
)