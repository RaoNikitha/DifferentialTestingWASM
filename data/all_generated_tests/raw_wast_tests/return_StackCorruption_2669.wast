;; 8. Construct a function with exception handling mechanisms. Within the exception blocks, place `return` instructions and validate that stack unwinding occurs correctly without corrupting the operand stack, especially when exceptions are thrown and caught multiple times.

(assert_invalid
  (module
    (type $eh (func))
    (import "env" "throw" (func $throw (type $eh)))
    (func $type-value-eh-vs-num (result i32)
      (try (result i32)
        (do
          (call $throw)
          (return (i32.const 1))
        )
        (catch
          (return (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)