;; 8. Test Description: **Deep Nest with Mixed Conditionals and Immediate Expressions**    - Configure a deeper nest containing immediate expressions like `i32.const` within `if` and `block`, using `br` to control flow between these intermediate structures. Validate operand stack unwinding and continuation.    - Constraint: Validates combined operand stack unwinding and control flow from intermediate positions.

(assert_invalid
  (module
    (func $deep-nest-mixed-conditional
      (i32.const 1)
      (if (result i32)
        (then
          (block (result i32)
            (i32.const 0)
            (if (result i32)
              (then
                (block (result i32) (br 1 (i32.const 2))) (i32.const 3)
              )
            )
          )
        )
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)