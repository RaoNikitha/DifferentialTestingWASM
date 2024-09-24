;; 1. **Test Description**: Define a `block` that calls an imported function, which returns a type different from the declared block type.    **Constraint**: Verify the proper handling of return types between called and calling modules.

(assert_invalid
  (module
    (import "env" "external" (func $external (result i64)))
    (func $test
      (block (result i32)
        (call $external)
      )
    )
  )
  "type mismatch"
)